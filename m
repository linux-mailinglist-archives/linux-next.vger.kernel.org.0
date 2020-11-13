Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEFB22B17E9
	for <lists+linux-next@lfdr.de>; Fri, 13 Nov 2020 10:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgKMJL1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Nov 2020 04:11:27 -0500
Received: from mail-eopbgr80083.outbound.protection.outlook.com ([40.107.8.83]:57212
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726255AbgKMJLZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Nov 2020 04:11:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXYbeGVSduKY6aPNfAfDWSiVyDynIN3v+MmDK4Gr6390l51wOe9jAdsaQvAhZrs48Us1Zv2afnlgLX6g5vHBWQivsfPBM1NhcMboX6aMrKn72oJGZWzb4DD2svJjT4Jqv1wxVe4h3JEePQL0qIXY+sip5hWfKBLcHbb/bly7zIkhn+dnRt2lOQ27Iit+IB2WZ11EEtE3NGxRtUmbrRT6Ut/cDfuD38ZZ/g/CLH/I6UCB18OVAoe2AyWEQyMl7dRtpvTG/WwjRnCtj3r3Rb37IZr0kkev3rs5RjjQapRbpYOwTaXmOFUSjOxk4yj7Mvui7THpyGcxp8QRtIsKN4eOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8JJlYNLABXtoepazyn4VfCS/TF1LF5y4FXZjHnymj8=;
 b=G7+2a/Npl28jfQw62B7P90Hs7et612jPqk4C0Pyc5n/zyQDZHvRyt/1S8TtXH5QLgxQTlO+5OiHtP3Sx6Yvo77a5p1yj69t1CuyiZuOQ84XC0ziOoYCQRYYuqEu+DUHK4MhKyAm4pjHlVTslsOmUucnxYBjSZ5NixjF6lSxNYQAkpRXLPdzRY1OjwhO/VjmBhjDma/ErP85Y4/4A6+tWjWTp+TRXv2c/9wXWbCDOHAipLFhXm0ynyp3Dzuz9XU0w5e4nIGPE6/t79tYtYqZcwtCObT8xr6VbkMZP7oQnSe8qoiXCBxBf7A5fpt9ZfrueBlYN5c3ViPHZVjMtpz0LWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8JJlYNLABXtoepazyn4VfCS/TF1LF5y4FXZjHnymj8=;
 b=STZL11AfW+PakYHbBBXoCMpxkOnE2cJEMuUDdJzmhzqkCpqfNMa9iip/gxhIXPB/wPG850JU9QvVPRhzWuHureNnsDgRW5mwmHKHwttD0SNMBMo0Wlyz/tpLs4gtuq/kj6Z2giWSfWb5yYKPxhUy+9moftGocWOgQnh15/d3nTI=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 09:11:22 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 09:11:22 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the usb-chipidea-next
 tree
Thread-Topic: linux-next: build failure after merge of the usb-chipidea-next
 tree
Thread-Index: AQHWuX757pEgqtM8+EWdK3f781LMdqnFxtAQ
Date:   Fri, 13 Nov 2020 09:11:22 +0000
Message-ID: <DBBPR04MB797922ECBDD15CCA2D89C30D8BE60@DBBPR04MB7979.eurprd04.prod.outlook.com>
References: <20201113163636.6a034653@canb.auug.org.au>
In-Reply-To: <20201113163636.6a034653@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3f02bbda-a19c-47d7-f0cb-08d887b416ed
x-ms-traffictypediagnostic: DBBPR04MB7595:
x-microsoft-antispam-prvs: <DBBPR04MB7595E54B75097D433BFF9C938BE60@DBBPR04MB7595.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r5j61m6UJ3AglM4OKnZsMEXl3J86H7g3IvUy4LMnN9kvakAu+e9zuc35xQdezv0wZ4EVy1tEvTHNgPXtfb0+N/KEyQMyDb5S6IAalK/Jtz+y+7RnAImt/zmvllVrlFc/X2zKDU+rJXnX9PhbnsyM4PYghmRucPdbIHB38TaaebISEl29SU2kB3YYbFSi9BmYMRoI124seQLyEekrrKS1vrnJ8ZouWcigu/Ert1gN+GDHnfXdQwNK7A64dqDQz6hv8+ft1U04nGx77AqD6GbpLLspsSY593Bf7dBzTr4fNxGr63UnPk0InCW/XEC+tkewQEICKpklBSaqnQvd0xgQWw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(66556008)(54906003)(66446008)(4326008)(8676002)(33656002)(86362001)(186003)(316002)(66476007)(64756008)(66946007)(7696005)(2906002)(71200400001)(44832011)(76116006)(8936002)(4744005)(26005)(6506007)(5660300002)(55016002)(478600001)(6916009)(9686003)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: MhLNm6PwjfEUb3elUcZtUJIQ2GgV80WWiPujwr1Si70/BJq9VZTmG3/TP3MTiOMaJg2xgOTTZbCtDCYlkgQH5ISoytj5toS7luv7AVVEwwP6s8LWMfN7SqfASh0MtaNH+J4AsTKzilJH1JzoEXdsU+TZAYXEDSlf/fhFFad/dYgldViukf5c9Jb18/HIa8uzvYuZ0JGtcfuL6WuUr+Wb3kJqEpipfuvPNPbzpyb4VQBcVs2feoPwZMLr9qo/oSy1GkTN0eGn+IVcNJiGifEp749ZYNeGkOVzY7Vs9x+BsNtKvUZsu110GyD3+3pMbq+f+7AFnOar6svvm7557TEYjfjKYonquibxNCGrdYJxk5rqeLWmA5Td8+LUc5PINZSDg++Rbo5tAMS8U2AlgYI3PKTQE68PklS7juxtIIknDkOmdRqlet8WfP+4F4ezqx5MjORKSMUC3cL9vtwm6GDC0gE2ibmmsZa+vQ9kX0UK6V0/BB/POdUxoGkAo0EjPkEAZauypGOLMAOeMxGKf7lQnpnVT8fqrE1mmx5yPXFZ78KcCIpvtjjAAuvFx37gsXCODmwBgyWrT7scKkuIqfNt62zBFiDNKtX6+ZMBysxHgd7tsWGntaxQ2tGQcY8PlrA1C78IEhumN0/b4d0liDxr+g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f02bbda-a19c-47d7-f0cb-08d887b416ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 09:11:22.1012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BV/BaLUfXDzbUbHy4sGk/mYqo9sNLZ44J7aQ5ZzckqnFV6ybBr8DtjH7LtoItv8lSn991cz27fhOkdxacUPsTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


=20
>=20
> After merging the usb-chipidea-next tree, today's linux-next build (power=
pc
> allyesconfig) failed like this:
>=20
> In file included from drivers/usb/chipidea/trace.h:18,
>                  from drivers/usb/chipidea/trace.c:11:
> drivers/usb/chipidea/ci.h: In function 'ci_otg_is_fsm_mode':
> drivers/usb/chipidea/ci.h:440:47: error: invalid use of undefined type 's=
truct
> ci_hdrc_platform_data'
>   440 |  struct usb_otg_caps *otg_caps =3D &ci->platdata->ci_otg_caps;
>       |                                               ^~
>=20

Thanks, I fixed it today.

Peter
