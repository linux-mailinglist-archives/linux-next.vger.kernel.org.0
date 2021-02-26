Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED48325C0F
	for <lists+linux-next@lfdr.de>; Fri, 26 Feb 2021 04:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbhBZDlo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 22:41:44 -0500
Received: from mail-eopbgr690088.outbound.protection.outlook.com ([40.107.69.88]:50862
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229492AbhBZDlm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Feb 2021 22:41:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4SqDnABEZZA2I9iuGdUNauluh56I/YO9/5+m/3KZTO2QN44JLSY/huuroIGuzvV2dePqdLoImEubSGTzcleljWJWC/WBG8E7jAZV09AWsL0+tFd25O/Nrm8SjcJFfaqx7sldu65mnSUuAwN8WkwoIuTwyJM3EC2LK+bgD9J8gabcs42AvsCZsidVmKUJp4ccgn1EwdtvfjHCYxFvJlNvNmdG3mb86K7g18Lqf5eq/TSC4VRxyLvEG+oJ+P1V13xbmowh88K0/Cj5WVGrlO1ASa9fZaDh00R65/Ia/rkpbQcapD81EhTzZApVcZKIxq2kPHN4YdCSOjeXpvzKQhvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBzoiU9n3m2qL3UjdWg/83C4y8ovKZhARTa6UF+Baeo=;
 b=jBwSgRuvfgmc3UYuExOhU84ppe1FO81RiqdBbDJ9ObtdXwh9MtTuo1XP0q5lGr6s3I8Gw5Zt5svIALB4BfjL7zRC5MzlYnZl15UKnwG0IxbMh/IVaCiqE0g/2PrYRFamZ6sv2KJuk9G98ssBSjTahAzsgRBnAp0SRiP6ygPHAzeCIDharmFHjD87GrP2rz2AaMcH9WYRie8PffXqI1jjiLCAXs8oFANwLRK1aRoj0CtKobOaj2E2naO+Q9LrTlbro4SMKyFPiFxYbEqZ/baAqLktsXRNFLvCGeP8Fj9IrRSHezT//OVCMwrEnIuK6wGDME+H3W82F16T59uJi0w9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBzoiU9n3m2qL3UjdWg/83C4y8ovKZhARTa6UF+Baeo=;
 b=ht/GaOGb2BUFVn7Mn51sdYO5tSZufZR9OdgEz143GMZaKZ2fwdjKjHeGAvJTARw7RtxAJF2zdr8p7ZAVhVS9RhzigM2doDE2TmG2YnIAnqK3Wi/9l1XonooeY3TTpNmfQwhAMaFfV/Mucde0RaXAA+OymS76qfNd6gWd6HXONI8=
Received: from DM6PR12MB2939.namprd12.prod.outlook.com (2603:10b6:5:18b::24)
 by DM6PR12MB3836.namprd12.prod.outlook.com (2603:10b6:5:1c3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Fri, 26 Feb
 2021 03:40:55 +0000
Received: from DM6PR12MB2939.namprd12.prod.outlook.com
 ([fe80::bcb5:dc9f:c49c:9faf]) by DM6PR12MB2939.namprd12.prod.outlook.com
 ([fe80::bcb5:dc9f:c49c:9faf%2]) with mapi id 15.20.3868.034; Fri, 26 Feb 2021
 03:40:55 +0000
From:   "Zhuo, Qingqing" <Qingqing.Zhuo@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Recall: linux-next: build warnings after merge of the amdgpu tree
Thread-Topic: linux-next: build warnings after merge of the amdgpu tree
Thread-Index: AQHXC/EvR9Udpw97fEO3swA4vD42MQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date:   Fri, 26 Feb 2021 03:40:54 +0000
Message-ID: <DM6PR12MB2939DD7F8DAB45EB3122A5CAFB9D9@DM6PR12MB2939.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a6a8c26e-5dcd-4c3f-2979-08d8da085276
x-ms-traffictypediagnostic: DM6PR12MB3836:
x-microsoft-antispam-prvs: <DM6PR12MB3836EE3C3A825DABDC5E454EFB9D9@DM6PR12MB3836.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rvhEq/mM7Au/oTG8FGsSR5KJzoQsi2VRXcjsK9S2neQNmUlNRPJ1goYYjjnpHQvw8DJKepZUgDUXm1TUxclFZU0kT1r/CqZ3+Z/BYoESVuqWfPxMhJNQVHcE4m5nu5srcVcXfgw3EH4K7aZGBG9gkBEWa5n+EZaRuXMziSWgzIlGxDqms09MwOmdYr323WXgHCozHJ0x6+C6i08kecgfje+en8BAbPPkChyxpGh/ajsJsHL3SNAoAvCAYzG75IpTUaGID1dTRe8uNbODY1nqtpEz5cyJjvSuFPuov8HKRYTWl+4xVcux5dQzc9Zti8u7qLD9TzzgautJINGU5/7qw6knBdCPBhoBHpsY1oZLtix0gqKhix3fxc1Yb25jbhT9TxhXMJsyhNqcRrfRk2xEmUswBuSUYWdFUk0OP6uWv/FI70VyanQBehfCxEGt/IXRoo72ZnQCWo7LjiP3WCGOFOwiLb3xoz07MCRQquu2dEWCkVlkOZ3qmlzoVsi/Ho23gsL8ka8ugpcUCg8otMF17A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2939.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(7696005)(66556008)(2906002)(6506007)(66446008)(8936002)(86362001)(110136005)(55016002)(52536014)(54906003)(9686003)(5660300002)(71200400001)(64756008)(316002)(558084003)(26005)(66946007)(33656002)(8676002)(186003)(4326008)(478600001)(83380400001)(76116006)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SVCXVPnXfk8lCe0quuLsPEMBmjJ8sAsjmTzIf9326F+4UPWFZGfDeRuvRbfX?=
 =?us-ascii?Q?QqDn+SSqGDd1BhHfD+tt4XIjYWxJ/kfWNDUrqrx7U7Xzh55UaZIAxinEV18r?=
 =?us-ascii?Q?YpGdZ11evqgwqFnIDNAAJHKioZ69nSktIIbcrnk1u9L7hXh7r3h+hoasfZTu?=
 =?us-ascii?Q?gDAs1pEcB57RegurPs0nlxC7JL7t87lOoT3/JkqcvpVkWwLmoC2XIdlfPGYU?=
 =?us-ascii?Q?25YVn5O9lt9gb9Ryl9xkWk6DBlPzl5omn6UBWbDxNM/bqOtABcg4tqMhbLN3?=
 =?us-ascii?Q?8WY5ZTmQduwxdmMI0ajo4e+/WxYFszFl4GsRGTF9cBxx4zzstF9Nb/N05ivw?=
 =?us-ascii?Q?1g8j3QsdUVodZnjAABIcjWl0rJZUzivt8w27obfiMS4DehmdwP5KhhDXFH9M?=
 =?us-ascii?Q?MT/z+iKiKsejhXv9D0nFCXdy/u36B24e3JSzxNCCLLnOhnfnHBxDXnudPkB6?=
 =?us-ascii?Q?9fVoak+ypYpGGCPkQh3lGPPD+K7UiNTZJq728iM3j8L+VNuyzS22VFVm6oJa?=
 =?us-ascii?Q?q5v3BI06tCUpiBEKZO9bJVGA6kZAW38BfVbs/ZJ5fA6jy0FzOMdOdsd9D5Gp?=
 =?us-ascii?Q?f/k30FK4WzC+FjjGy7GHQwb4SNJnb1xbrlf/5qPIK8hrp362DJSRyOyry2i6?=
 =?us-ascii?Q?Y+mM+VsIllsOdsHJz0m+ksRvg74Ixe5Qr52Rje/+iK2eGbw61xgDAOF5Olpw?=
 =?us-ascii?Q?CATs7CUBWkFSCsqfRHyraJGW+AZXCABsVLj7rxYAOv6ek0od08y0aol0goky?=
 =?us-ascii?Q?0ivCP17QG6s7szFQf+VmyVgLFwm3nPSF/mY4KQK6Z8e23VJYqo2IWE4bZnX1?=
 =?us-ascii?Q?r6W4anlx8yfVeQw6kNzyYI3ah239KVGfLyDsMI8yn9ufC/qUewOPpvHeQj8y?=
 =?us-ascii?Q?PuoO8Va+Ktu0u8INM1ZnHx2UGXnxJ/9TQNmuvuYKtN4YKxCGppq4WAvg1jnd?=
 =?us-ascii?Q?bR+4T0gW6gZLC4i7r/tS59GQMgFjHpY1zT/HL4MhsQ8t7NQlk462wH3MZofk?=
 =?us-ascii?Q?QDLf8Zx40mvWAIY6jORqFsZMbw5CYTI9q7muHMHggN9sExptZ9zR7L6M6Edy?=
 =?us-ascii?Q?zRcOJJJ0mnUYDrUDBizPctn7QhbtJbOHwohJMtX9+O7yKXj/IuWH4c9e8wXx?=
 =?us-ascii?Q?tYI7lBFGdYXNGWGSg7FntjnFFTw3Y5SDGttAtSAY0pl/KjIa5KjW37v1q4EY?=
 =?us-ascii?Q?d2qyL72GiGdS2OFrWBJt7YSJKbA6QPUGv1tNNXf8O16grzDtcaEEusXebCeb?=
 =?us-ascii?Q?jnnrEM/S/ObrKdBZSVGLLTrtuaVtaJOSZj7i+26ahIZJdFI6Z31glRZ0MTwt?=
 =?us-ascii?Q?LWQTrX+uiGRXx5+0HaY1GFGZ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2939.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a8c26e-5dcd-4c3f-2979-08d8da085276
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2021 03:40:55.0004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y3GdScdcMbdTEu34nWSayYUMVAPruwm+S3igsHqb09ZmWd2IARh5b2O/rQESNJbc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3836
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Zhuo, Qingqing would like to recall the message, "linux-next: build warning=
s after merge of the amdgpu tree".=
