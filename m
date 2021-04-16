Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD135361971
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 07:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbhDPFrd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 01:47:33 -0400
Received: from mail-dm6nam08on2049.outbound.protection.outlook.com ([40.107.102.49]:47936
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231598AbhDPFrc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Apr 2021 01:47:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCjEpDkKTIbBMJvQbOrM4EZzOJEo81kLl9pOhHPtBW02RcXpU3DDEPYFppxkOmD4EA6OnTlIRbg+EqhSgqmoq1kNsQqneEz9xAM/KAyKYp6OGwyJZx4wiI4S5IXFRO/RZpLD/rvqTkQ44RN12uIvD7K9OGOGRZd2M/RrsRxdz8cYOTC2GUHXdLQlfJO0FnFtq2X5WoEu6Si51+pS8WHmkgLaCdiENIsmuaMzIODvACSR/4+7IXcEK4cRSCbxWVGBUCl7iVtmv1U3KAcSTxUDjkA+TGocsretps4u+ZIx0Ro4fn4ZuE6SotW1uNgRQPzNKFiNKzQjyBecgmqWbE847w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz837MbfPEC6y7B2ZSMT0p2Qwi/kV7Zp3sFcamHhWiI=;
 b=PMwW7iNB3gk5OoduY2N2NSs6yK5CRwDqs/3Cxdi3UaNYU3+9xSJGsphowd/waKm3+G7+qhpqj7GuNNTudX1JrONofSBG4b4BiybMyXa0QfZyDTnpe/LlFhxW/zxCwAl3U7uCZ+fukfqJwXL0fcD+4RJO36CfhNZ6lSc0XZORaNauTvy8sk4+GI1XiaFeafzs34pvMCqU7kquCLsTsXwU5eRppfXCu6seKXgQbnGmeGbfEAjAGJSXHgOL5oqi22hNaZcJaiDW7nphwJL8iilGHn97JHp4EGtAcGZAqhW50HtC0FpspGdgbV10Ohz019xU3YcYU/AwJnnIXkfmJ3zhnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz837MbfPEC6y7B2ZSMT0p2Qwi/kV7Zp3sFcamHhWiI=;
 b=KPbDdeJSah/60Tn/TcCtyWE+8wtqxoXcga+fOyJIlTAgi9gpXzxFlfW+nYR1VBpyNu2p10rnTDgdrkCMEAohfyj/aaCw/4XUbVyzz8mR4GbwjEd/49W39NBRJ4a4D2Wu+5HwShO4VwakOUlJXKm8yBx13WDVSnInSv5FniYljLc=
Received: from BYAPR12MB3238.namprd12.prod.outlook.com (2603:10b6:a03:13b::20)
 by BY5PR12MB4885.namprd12.prod.outlook.com (2603:10b6:a03:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 05:47:04 +0000
Received: from BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::5870:fcd6:b13a:c49c]) by BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::5870:fcd6:b13a:c49c%5]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 05:47:04 +0000
From:   "Liang, Prike" <Prike.Liang@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Alex Deucher <alexdeucher@gmail.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHXMmnrEXRp0HuUjUazTxShXOxz06q2dQiggAASigCAABp1AA==
Date:   Fri, 16 Apr 2021 05:47:03 +0000
Message-ID: <BYAPR12MB3238224BD17317FCC2975CFBFB4C9@BYAPR12MB3238.namprd12.prod.outlook.com>
References: <20210416124044.53d4beee@canb.auug.org.au>
        <BYAPR12MB323890BEC6212E401D10545EFB4C9@BYAPR12MB3238.namprd12.prod.outlook.com>
 <20210416140848.6f458345@canb.auug.org.au>
In-Reply-To: <20210416140848.6f458345@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=fd5b2b34-564e-4829-841d-ab6110291758;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-04-16T05:43:50Z;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=amd.com;
x-originating-ip: [139.227.235.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b054180e-353c-40d0-fb83-08d9009b1042
x-ms-traffictypediagnostic: BY5PR12MB4885:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4885A1D374FB8AC0A1146C83FB4C9@BY5PR12MB4885.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pp9XSDWIgk4Tq6+4hk1ecdWXVkN/VF/io8Bht+Y8/BgXKn9n1mT2xDlJTTPWN9b2kaNuZamPX4zSfjuCeeVQYU/XcowWxwPsOfL8pJ32m1Iyy0vAHx5a8zhhb7uWmbktMoF5JKLF9UWgLlQQpM/NGWZU6rM8r6oXhBRR59L+9/cPRELAKbbvxaPve6RbGvY7twT92hL4IUYmgUGjRqcV7jZPDJrDsZrlXyhec0gpHvxImKpnPkgd4rgUIe0Ge1rPamEg2xLf0TNYinsOCeg6RxM0zIX9nF59fIsPSyT+WT/WKrNWWyVARHJX1FcfTtqLc5EY+GduQDFyjhPUEXDSpHS+RoHWoY0T3O8Pao0EW7zWzG977/R2CKkUUWcZfXo97mdYGp7JfcP+hfTwyMJLfJilmepRNOmswZmN2Ew35etJsN8b79p3x6/gNHMYYkA14oAj4wu9CHQG5GqOScgGicrPXnwGPLsNjAZMv0GxbKCPkcya2+IwHgbM7Jhhxk0TuRPBYIkKrHBWjQJ6a1V1IBE3FO5RidA6CcDZYU9lSaBcyY1cQCiQabW5BFA9br7hj6UQpf0Cnxi4CXjXkfdkr4LoJQv4jv2JIdqFWivCTJk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3238.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(83380400001)(5660300002)(2906002)(26005)(54906003)(8676002)(6916009)(55016002)(4744005)(316002)(478600001)(122000001)(186003)(9686003)(53546011)(38100700002)(52536014)(66946007)(66446008)(66556008)(64756008)(8936002)(4326008)(33656002)(71200400001)(86362001)(76116006)(7696005)(6506007)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?vGUrqIc1fbxDL4kilVQzJMXXydlxMS4hrKpMRXNwXEYm3cF832080pEe3wN8?=
 =?us-ascii?Q?VwwrvItZLL2ezZ4AzkIxt+PEw08QrCb1fm0c7PdDDh9JAmFP/4kKwfc384SL?=
 =?us-ascii?Q?rNMB0XrLLuuPtlU8d3g/T7hOwS3WXUe6B+iUEJQ0AFmtowN0cg4fvfYU/cZy?=
 =?us-ascii?Q?m1fYm3EGSWxGIZqZK9vuOfeGS73UpBDCOg8Ekm5Y1SY21XSMziNjySRjCFSC?=
 =?us-ascii?Q?W8yeDrL4wZfPvtOxoizKHqxVqWWvx2PZQH8vMj5cP6w/+lnYPMR+XsBPqz/X?=
 =?us-ascii?Q?+ITCXKzoyrDZ8LjCIyl1qoOSWUkxpcfq9divvXrHW9++c9EBUlAss9urTnPn?=
 =?us-ascii?Q?cI9YeAfkTf3jWP/+WhXhf4/nXrHbGxJD2p6YQYWFmteTu43ckiz+wC4Au5Eo?=
 =?us-ascii?Q?xrhfd2n8K9c21a7faTe+t7/xEU6+uVPA37WAzJM1ioltsqT8sOVsulIwskO1?=
 =?us-ascii?Q?ozHkPWtI8JgYNRdOhQC16V0Nwey0eokPE+aluvg6/mgu6gwTTHLG19TY4ErQ?=
 =?us-ascii?Q?dhyMn7wM3lIWqeopfQ5J6LManx8TchF2C4FPdlpyhJqdfu+U8LyNzP0VPVQk?=
 =?us-ascii?Q?itjLL38roqb+innuNawOHud7s8vanMFSXCq/MKD17gueKntb4pGMSj//TgXT?=
 =?us-ascii?Q?9+dK2xrP5MhUjoBjuokA2bjmS7/854Y8zwqv8A9DeLLSxTCLAfevVel9ypRn?=
 =?us-ascii?Q?bpofHWYUse31rW1BYrcesGPMhizIQXHzkvCdbJbwaRJSiDob3GhHPvW6Pk8R?=
 =?us-ascii?Q?euUd30/Pi7GksXa0LHRL0cKzKzv6hkoSS/PcJdFdLJWgz76nrNmY25whALzx?=
 =?us-ascii?Q?qqnVEjlfSSMD+R4LTKMCk2Y9rECgupEA7OF9Q+/CrKHSxlCnIgCyyxd4rfCe?=
 =?us-ascii?Q?NMV6igxQ7h2gobml12KYjf3XoO6PxRJrYCADRHyx+vH2UwAi+hJ8KjYbc1rq?=
 =?us-ascii?Q?MYYux5wVP+MsbCsf4UtXltmOjHMH3DkVyz+xlQtKxgYkpyag7jw1xBp7bPzd?=
 =?us-ascii?Q?y9NXSdn9b686InXaqht9DXEDeJC3WfGqVbE6MJKiymgUadjkw/WLhNtV9NDo?=
 =?us-ascii?Q?NDFrQYlqeMAHCho8XLo4Y08QhTsPGTKFXd3oFOoavIt0Yjjc8PJbng5k7OdP?=
 =?us-ascii?Q?0hjpj/ekSLk2CzyTB04PggZMzJnRhRepqzMRmc42HylHxssNdO2T50jc3dcc?=
 =?us-ascii?Q?7wkZN4082pnWRPSj/vOeWNsJvgyShSs5Kovr31ZGvFyanBfDUt+XJVywNNK3?=
 =?us-ascii?Q?CutfRWB2ac9xeKoscDZAQJW2BXxPZJu22QEkq4X7kvPioQktNT0jxQv8S57T?=
 =?us-ascii?Q?TltXJHCCNd2HRjeR2UXiVtml?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3238.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b054180e-353c-40d0-fb83-08d9009b1042
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2021 05:47:04.1112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MXQA5B+K76d3Nhna2RkQ6xtGQTO1AIUJ12BSeHplJ486fh+bxj5ImelnnFE/Anca
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4885
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[AMD Public Use]

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Friday, April 16, 2021 12:09 PM
> To: Liang, Prike <Prike.Liang@amd.com>
> Cc: Alex Deucher <alexdeucher@gmail.com>; S-k, Shyam-sundar <Shyam-
> sundar.S-k@amd.com>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.=
org>
> Subject: Re: linux-next: build warning after merge of the amdgpu tree
>
> Hi,
>
> On Fri, 16 Apr 2021 03:12:12 +0000 "Liang, Prike" <Prike.Liang@amd.com>
> wrote:
> >
> > Hi, Rothwell
>
> (Stephen, actually :-))
>
> > This fix solution hasn't locked down and still being discussed and roll=
-
> updated in the NVMe mail group.
> > Will update the patch once it refined done.
>
> In which case, this patch should not be in linux-next (or any branch that=
 is
> included by linux-next).
>
How about revert the patch temporally ? Once lock down the solution and wil=
l land in the final latest patch.
> --
> Cheers,
> Stephen Rothwell
