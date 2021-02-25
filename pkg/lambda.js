exports.lambdaHandler = async (event) => {
    console.log("pkg1 here");
    const response = {
        statusCode: 200,
        body: "pkg1 got executed"
    };
    return response;
}
