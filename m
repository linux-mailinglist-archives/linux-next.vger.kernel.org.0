Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99FDAE0D3D
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 22:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388571AbfJVUaw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Oct 2019 16:30:52 -0400
Received: from mail-eopbgr730084.outbound.protection.outlook.com ([40.107.73.84]:41248
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388344AbfJVUaw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Oct 2019 16:30:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1q2vpwCXkaip3FFIDoFvo2EevNVrlnd052qUOzQhGPndQQZn0k6uWBXnEBYiJDs4bHlFhh3RuMEbS9oTySh/QJ6xaCu3GFsecL5nZSTOVigrJkkgBPdGmgbTG9AJcvVya2v7gm/08Mz+yYeSZDY4X0mPH+8d3/9TdOdDVmGuNdJsu7HXbHT5I107pIdXIoAvjeusxoic7RSOCN+RRQNxxFPODDGOOgyPyDxaCWfRZfzWD+L/hOB/qcg9J5+fE9LyVnfMfSP0COZ99aAR/KVwzqp/NYgLHyZ6QTa6Maw+dq2+hcQSuTYGcG3TkMxBWSUjJuyaeQaOg4tFeoVOFt0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rjQ88nqVRVP23hFDKlGqBsrgsY4L/hi8h6Z41cPcII=;
 b=ljlqrbXS19I/j5rkkHPKQv7Yk24vpUUvcxRuBYONgJfFKGg3Z3n2g/zbY8RRlZfZV+0I8WzCbOq9dOy0cItLiM7HsM6isQ5XrK3AvvmQqboTuw/HGDJ0UCqkd89uEiDfWc2w1pR2/bRk27/34gGuEpeh9kEOvN3AUtFOEz2oS1nTuH7BAz+gqv1aU2W7p8egcfaNeODu8lZ4mOrqEpbP/qqNLImzQNeSwY25GdvQgqkc1Dl8s8JmqsaBW77tBI2pu7nf4B8q5uN7AhWfuHbU0cxju0z9MWz47ux5TiGhXUa3jZVmJXSZ7nWAefrJRuCQbFswBLCbcXs8c1jlZ6cXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rjQ88nqVRVP23hFDKlGqBsrgsY4L/hi8h6Z41cPcII=;
 b=qsI8fJo0JN7Uj0XWXZjfIErHIJBpdfHE5gYIoUKLRv2sA5oSdLsJg0N2hNuRySRkyjIGPdTNE3r4kB3eCwQKvaWyah4ddEQCuriwWzutergRfRmQ3Jw0Q4Z9l9SttEdIk54B35/uNx50rWMht4qah5xWUT3rtROpzMuVI08+kGY=
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6352.namprd05.prod.outlook.com (20.178.245.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.14; Tue, 22 Oct 2019 20:30:49 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8%5]) with mapi id 15.20.2387.016; Tue, 22 Oct 2019
 20:30:49 +0000
From:   Thomas Hellstrom <thellstrom@vmware.com>
To:     Ingo Molnar <mingo@elte.hu>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tags need some work in the tip tree
Thread-Topic: linux-next: Fixes tags need some work in the tip tree
Thread-Index: AQHViRWtAoMoRM+NF0imfmWMacoxNg==
Date:   Tue, 22 Oct 2019 20:30:48 +0000
Message-ID: <MN2PR05MB6141177C37F2D1566E4FB341A1680@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20191023071655.10a9cff5@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 664efff6-ace7-4245-968d-08d7572eb998
x-ms-traffictypediagnostic: MN2PR05MB6352:
x-microsoft-antispam-prvs: <MN2PR05MB63529EDA6D8060143474D430A1680@MN2PR05MB6352.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(53754006)(199004)(189003)(7696005)(26005)(66946007)(66476007)(8936002)(6246003)(7736002)(446003)(8676002)(81156014)(66556008)(99286004)(102836004)(186003)(66446008)(4326008)(6506007)(53546011)(486006)(305945005)(74316002)(76176011)(476003)(256004)(81166006)(64756008)(91956017)(55016002)(6436002)(9686003)(76116006)(6916009)(229853002)(14454004)(71190400001)(316002)(2906002)(3846002)(478600001)(25786009)(6116002)(33656002)(52536014)(5660300002)(54906003)(4744005)(86362001)(71200400001)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR05MB6352;H:MN2PR05MB6141.namprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: StnHGSRnzPtMPnuIGVvngWLmULE0+HBKUHHLFzW4Zo9BWl0u4qB5T7JFN6Q1u5a5fGO04vbl4BmcEnHlGXvdrLbxsnpb58sncMQ+PtXBYBDN7MZ3+vArYMnJJl6NSaJdapM7zbSAVSGE1NyP93c/oxXTLHrNC8o6jJANW3cWtuC/dRVTpWkcNCGtefrf0pX0/tUO6bz53q92RXaIQMHkAcGAzJq/Fm9OXmjLB9E8aKB9C0FcWkwg5Oc3+vRwpnZzP/ArjViuE10Ll2XPlLXXXX6ZUjwgsU/4r9yVGhzux7SYxGiPwWsY8FCGNr3pYDDfxZGm4Cp0sw7fB1112OTti60r17JBcFepKbDnGDrcmqDp7uty6psgJ9r7ggU16rF+aAqHtU3H5CGQPRC96OLNs5kZ8jnsutYnE4hjh7lWygyiHNfxaVp19rvjHa+EgKoN
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664efff6-ace7-4245-968d-08d7572eb998
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 20:30:48.8512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dZuKZaX3q/J+9Ur6CgOlMGqP1uOk5gDgmNXu1GwdVMQgkG7mQSw22jMEScVv1R0sPVHAbRfNeDgQWbehnnbHRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6352
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/22/19 10:17 PM, Stephen Rothwell wrote:=0A=
> Hi all,=0A=
>=0A=
> n commit=0A=
>=0A=
>   6fee2a0be0ec ("x86/cpu/vmware: Fix platform detection VMWARE_PORT macro=
")=0A=
>=0A=
> Fixes tag=0A=
>=0A=
>   Fixes: b4dd4f6e3648 ("Add a header file for hypercall definitions")=0A=
=0A=
The cited subject is missing a leading "x86/vmware:". Ingo, please let=0A=
me know if you want me to respin those.=0A=
=0A=
Thanks,=0A=
=0A=
Thomas=0A=
=0A=
=0A=
