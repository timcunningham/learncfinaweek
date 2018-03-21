component{
	public any function init( fw ) {
		variables.fw = fw;
		return this;
	}
	
	public any function before(){
		rc.navigationSection='system';
	}

	public void function listresourceTypes(){
		rc.resourceTypes = entityLoad('resourceType');
	}
	
	public void function listresources(){
		rc.resources = entityLoad('resource');
	}
	
	public void function createResourceType( rc ){
		rc.resourceType = entityNew('resourceType' );
		variables.fw.setView('admin:resources.resourceTypeForm');
	}
	
	public void function editResourceType( rc ){
		rc.resourceType = entityLoadByPK('resourceType', rc.resourceTypeID );
		variables.fw.setView('admin:resources.resourceTypeForm');
	}
	
	public void function saveResourceType( rc ){
		if(len(rc.ResourceTypeID)){
			var ResourceType = entityloadByPK('ResourceType',rc.ResourceTypeID);
		}else{
			var ResourceType = entityNew('ResourceType');
		}

		ResourceType.setResourceTypeName(rc.ResourceTypeName);
		
		EntitySave(ResourceType);		
		
		variables.fw.redirect(action="admin:resources.listresourcetypes");
	}
	
	public void function createResource( rc ){
		rc.resource = entityNew('resource' );
		rc.resourceTypes = entityLoad('resourceType');
		variables.fw.setView('admin:resources.resourceForm');
	}
	
	public void function editResource( rc ){
		rc.resource = entityLoadByPK('resource', rc.resourceID );
		rc.resourceTypes = entityLoad('resourceType');
		variables.fw.setView('admin:resources.resourceForm');
	}
	
	public void function saveResource( rc ){
		if(len(rc.ResourceID)){
			var Resource = entityloadByPK('Resource',rc.ResourceID);
		}else{
			var Resource = entityNew('Resource');
		}

		var resourceType = EntityLoadByPK('resourceType',rc.resourceTypeID);
		Resource.setResourceType(resourceType);
		Resource.setResourceName(rc.ResourceName);
		Resource.setDescription(rc.description);
		Resource.setWebsite(rc.website);
		
		EntitySave(Resource);		
		
		variables.fw.redirect(action="admin:resources.listresources");
	}
}