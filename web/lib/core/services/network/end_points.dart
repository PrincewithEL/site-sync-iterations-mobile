enum EndPoints {
  signUp,
  signIn,
  signOut,
  resetPassword,
  completeProfile,
  verifyOtp,
  createProject,
  leaveProject,
  clientProjects,
  clientProjectDetails,
  viewTasks,
  createTask,
  deleteTask,
  completeTask,
  viewChatRoom,
  editMessage,
  deleteMessage,
  sendMessage,
  searchMessage,
  getAllEvents,
  addEvent,
  deleteEvent,
  addTransaction,
  viewAllTransaction,
  deleteTransaction,
  addResource,
  deleteResource,
  getAllResources,
}

extension Url on EndPoints {
  static String get baseUrl {
    return "https://site-sync-iterations.onrender.com/api/";
  }

  String get url {
    switch (this) {
      case EndPoints.signUp:
        return "signup/";
      case EndPoints.signIn:
        return "signin/";
      case EndPoints.signOut:
        return "logout/";
      case EndPoints.resetPassword:
        return "forgot-password/";
      case EndPoints.completeProfile:
        return "completeprofile/";
      case EndPoints.verifyOtp:
        return "verifyotp/";
      case EndPoints.createProject:
        return "create-project/";
      case EndPoints.leaveProject:
        return "project/{projectId}/exit/";
      case EndPoints.clientProjects:
        return "client-projects/";
      case EndPoints.clientProjectDetails:
        return "project/";
      case EndPoints.viewTasks:
        return "projects/{projectId}/tasks/";
      case EndPoints.createTask:
        return "projects/{projectId}/tasks/add/";
      case EndPoints.deleteTask:
        return "projects/{projectId}/tasks/{taskId}/delete/";
      case EndPoints.completeTask:
        return "projects/{projectId}/tasks/{taskId}/complete/";
      case EndPoints.viewChatRoom:
        return "chat/{projectId}/";
      case EndPoints.editMessage:
        return "edit-message/{projectId}/";
      case EndPoints.sendMessage:
        return "send-message/{projectId}/";
      case EndPoints.searchMessage:
        return "projects/{projectId}/messages/";
      case EndPoints.deleteMessage:
        return "delete-message/{projectId}/";
      case EndPoints.getAllEvents:
        return "projects/{projectId}/events/";
      case EndPoints.addEvent:
        return "projects/{projectId}/events/add/";
      case EndPoints.deleteEvent:
        return "projects/{projectId}/events/{eventId}/delete/";
      case EndPoints.viewAllTransaction:
        return "projects/{projectId}/transactions/";
      case EndPoints.addTransaction:
        return "projects/{projectId}/transactions/create/";
      case EndPoints.deleteTransaction:
        return "projects/{projectId}/transactions/{transactionId}/delete/";
      case EndPoints.addResource:
        return "projects/{projectId}/resources/add/";
      case EndPoints.getAllResources:
        return "projects/{projectId}/resources/";
      case EndPoints.deleteResource:
        return "/projects/{projectId}/resources/delete/{resourceId}/";
      default:
        throw 'No end point specified';
    }
  }

  static get login => baseUrl;
}
