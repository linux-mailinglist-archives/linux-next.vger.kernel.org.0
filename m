Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25F1323664
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 05:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhBXEKe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 23:10:34 -0500
Received: from mail-bn7nam10on2047.outbound.protection.outlook.com ([40.107.92.47]:57184
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232870AbhBXEKZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Feb 2021 23:10:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2CCS3GS77mEV2MFt5K0oYGlAU3i0tsRs/yDt1t0GqYnbwOd7LHKlxsmd/uhTjG926jo4FvRAG2+10Kfq0fMcVMvlW86WoUwcT6Zv1pXJkI/kpL4JlMLD45VLSIx043C5ulkNG1ssv+kIEWmVB8dnNNcWyClRdcbSpXspjnrNvPa6BEKN1YFoOB48DsL6rb8hmbShNx9/Q7yrAYnhRTaZA/63ecBl12wyzsfCUGRU8AVKfEjE5mTedvsSaOc/yOM8cD+ZdiyAtY23pcm3LTCYEUEkxc1EFCgzwXjosyshMOxBhBCpjRbVmqQBXoeWq5ml1rV3N002pFkp2ICQCstdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfNwZo9r/uPtihRqU23JJdj7iHl0XOivxHxaHNowwJI=;
 b=iCIIXDr8N6nJUv1GeJDQQYoQYwcUe9drYIa5pgAkFteAXK8IJS5bj5wX+Jy5cka/pdbrHeKrtYdeYKvZi+2av8+u1zCDH/1xzmcdsPUqxLZFS7aIaEoJ2TXPMQNhoY30hgjxgDbxCC/hdk5l3AM1aPfAQP5u6dfD0fuS5JWBXC8+HqdPVRHW09YSG3Bo7EZkUlLSLZvcPHQtuuEOceomt10c4b1vP3cxH8LpEYF1wuTTtFaGu1KzordTtK5U5Rx7lXkbXcRq4b1OKlphA0fyHnKvkBwfY/zGwbs479FBk3Jbhtzt19NPRO0vKgZKA+sQNadKXEjVuUKTRUFM7x6I2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfNwZo9r/uPtihRqU23JJdj7iHl0XOivxHxaHNowwJI=;
 b=32L+Ga7KzZiziM+4nRZxPf9t9DTH7eD+3U19BY8n7g3IjtKBYVyqSRzFcEz0xFQ3pS8pNd7W0XdFxYtZW4Kz/CWpsYq7JLIwSUcSRR3+xIl0UWPvrf85cvvyR4rlppB+RdfaL7gd78rQXHlJKxq7Ic5HcSgNc0c7HB/EhExxF+o=
Received: from DM6PR12MB2939.namprd12.prod.outlook.com (2603:10b6:5:18b::24)
 by DM5PR12MB1545.namprd12.prod.outlook.com (2603:10b6:4:7::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.32; Wed, 24 Feb 2021 04:09:31 +0000
Received: from DM6PR12MB2939.namprd12.prod.outlook.com
 ([fe80::bcb5:dc9f:c49c:9faf]) by DM6PR12MB2939.namprd12.prod.outlook.com
 ([fe80::bcb5:dc9f:c49c:9faf%2]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 04:09:31 +0000
From:   "Zhuo, Qingqing" <Qingqing.Zhuo@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warnings after merge of the amdgpu tree
Thread-Topic: linux-next: build warnings after merge of the amdgpu tree
Thread-Index: AQHXClTNXPWTcQ83lEadTG0nUZMYgqpmqJSg
Date:   Wed, 24 Feb 2021 04:09:31 +0000
Message-ID: <DM6PR12MB29394B1C0B88CE17F8CB98D4FB9F9@DM6PR12MB2939.namprd12.prod.outlook.com>
References: <20210224132849.439973d5@canb.auug.org.au>
In-Reply-To: <20210224132849.439973d5@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-02-24T04:09:28Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=96d8bcbc-224e-4405-a90e-6d4f156ae865;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0e6d378f-f7a6-4ce7-4af2-08d8d879fcb2
x-ms-traffictypediagnostic: DM5PR12MB1545:
x-microsoft-antispam-prvs: <DM5PR12MB15451885C53D978B05C8C430FB9F9@DM5PR12MB1545.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VGH1foZI3bRf6DYiBeIUkfNM7xii5kQPpmIQDKz9IYuTN0niJZQjvBgnVBSS+CoVjierF8lYs1D0iEM2Bvzpcocjz8X97CFgQUW412ylwLW3UQFgKMhq456jhOIZWNnziD8BY9BPucHyl9gd7WcdGTi064PgyxPsxED+PXb06BZRrRhibUiGdxQwB1pdYEw8BtohiIee1QaPj2FPD/x70D23ysHcw0Yprg009vcwUVdfTXe6503HGdZj7yzrYcMn0WKaQWiM9UdkvL9p8/8+gpm1551aOI1Kl6XjTrH0/Be1ZPw8v3RcP6Zy0IeDSXbG2gmS6kffd7RJJzFQ41cWE7Sz1iYkz4BBrd4qs87oo0vyazmPIXRKhCDymuTpQ3uqq1davGttycVAI0TZ9/eCTNLlsa/PVe1THeYrblvacQ7F5f9721SwTKMk39VBCc4GnrNlMya/VLH9vFkmCiM+NJ+yGQHonxzhrUz/j4MqPijT2eFDL6/A4Pzunxb3m32xwk651d047GmsghAuIKs+BA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2939.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(7696005)(66556008)(86362001)(2906002)(316002)(6506007)(33656002)(478600001)(71200400001)(110136005)(54906003)(4744005)(66946007)(66446008)(5660300002)(66476007)(64756008)(186003)(52536014)(8676002)(76116006)(83380400001)(9686003)(26005)(8936002)(53546011)(55016002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?AoLokDHaQR/I0JISnVmWrsemz/SlNkihZosjDiM544TmCgWGlm+onbwuKkpO?=
 =?us-ascii?Q?DhrLLmKQNHULZ1bbXa+ul/CN0ilVtp7Tcg+BS1JjtkR7/Kh8/slqnzyBbUm8?=
 =?us-ascii?Q?kYbxWMsE/PpHfDYkVWv2p2HYFXvq1P+5JRkvhuoPArm8gIWHkkQib+x5uO77?=
 =?us-ascii?Q?9pXwoSo7HweTDQtf+0G1HdRPtpliDrALmhgNeQvyvkYnmLH7n2KGn0f4G+5W?=
 =?us-ascii?Q?vRuJaAKTNFfM2+/IVY5liyXeXzgo3GFDfXoVhBg502Oc8dlkr9w+YsUrBl/p?=
 =?us-ascii?Q?f3bX5pjCbAiKW0PO4m976I0R5vDcHuDqyUODKNvTjVKPe7x6fX9qZEmoe7xz?=
 =?us-ascii?Q?qiK1jXHYDmQxkEBkb2v3L9U0IhSyky1coehB9pjnscgEGuArdYw4Cb3MqZw5?=
 =?us-ascii?Q?LyT1ObJhL8CbsH0WDrZQt9JebCrflAXCSFB0T+Vd03h8A66Mv0Ck/UdRw4PJ?=
 =?us-ascii?Q?c+DH8JlxqSWV51xVgDapHmrp9OM/7r/ee97+C4GNFE2ZcHM2ORpZvU4aLoH6?=
 =?us-ascii?Q?lkrrH4VEQKk4PNb3VNQTJ1hpG1tOCGDHoN+ZeymOnFCtJfQt9hliIk5bBN4Q?=
 =?us-ascii?Q?rDb9ka2xwE9AeVzbR/iym0R8sFSs+ybrfsrVGTQflSICFVlPTF+QtDwwPZxz?=
 =?us-ascii?Q?GhSo3yTUkoky6T9vNYeDqrQel2qd7QRGlTH6YTjv9/rAXyz+ncMXGMTzqzwd?=
 =?us-ascii?Q?rV1zDL5TOKZYCso1rWA3JUncNruLiIFuxtQIvwM//c749VEJRzf+jTcUGj/Q?=
 =?us-ascii?Q?uritZzZ7DZiP867h0cpAERtAbYAhRPYrhk6ffkFOfi4+sTqbRrTRNVGsjJO0?=
 =?us-ascii?Q?szCu2OPIDnJlis9lnpZUu00AUdUUF07296H5sa13RIGtVopGVFcUIqbQZlSX?=
 =?us-ascii?Q?WNubWV5rMXDKJVlLV/6uqg8ITGNhcSFOMWT1QPZntqhWrhwXCTo3/gAZmBm7?=
 =?us-ascii?Q?aH3iC05Jng64nMqNShsKscVfIZFzvf70GvKDI85+yYmBecxbXK0zElTO/aIS?=
 =?us-ascii?Q?x/qgBPWySD3Fg5MTev7mKqA4H8pi8R16vljNK9nHMCss7vIx3a1ONiI3ZHa+?=
 =?us-ascii?Q?qpoPelcE7TWCORn4KIMyBzMTwtnCmC5tkgwK7q3J8Vkgxl0rgeWPwbc5Qru7?=
 =?us-ascii?Q?beJz9zM1N0ExEt29tjQXKDJ99fo4AfQ+sWe4q10h4FNEA4xA7YcLOHyRKYJN?=
 =?us-ascii?Q?IGyS7vX/kI66xlc3T9S6ATzE4oGHtTTFzKyg8Y/q8qUvXokRvlFjwsi7oMgt?=
 =?us-ascii?Q?TJ1xbalwjKIkHb0T8fR3FHubH08uLECpzKqHzP4QRoK9Knk+pZNlgWGaDkjs?=
 =?us-ascii?Q?7WLTqbzzLZ1nysA//iEXICqa?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2939.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6d378f-f7a6-4ce7-4af2-08d8d879fcb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 04:09:31.4401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +koOBQ976qZXfFmD4XfsD3wy3HcApIJTcJJslf4tjn8sESSpf6g7KkqRow+QwwCH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1545
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[AMD Public Use]

Hi Stephen,

Thanks for your feedback. I will submit a fix for the warning.=20

Thank you,
Lillian

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>=20
Sent: Tuesday, February 23, 2021 9:29 PM
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Zhuo, Qingqing <Qingqing.Zhuo@amd.com>; Linux Kernel Mailing List <linu=
x-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.=
org>
Subject: linux-next: build warnings after merge of the amdgpu tree

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs) produced=
 these warnings:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:380: warning: Function pa=
rameter or member 'vblank_lock' not described in 'amdgpu_display_manager'
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:380: warning: Function pa=
rameter or member 'vblank_workqueue' not described in 'amdgpu_display_manag=
er'

Introduced by commit

  3cfd14b67b2c ("drm/amd/display: Fix system hang after multiple hotplugs (=
v2)")

--
Cheers,
Stephen Rothwell
