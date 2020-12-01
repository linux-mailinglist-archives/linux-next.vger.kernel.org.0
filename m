Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67412CA076
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 11:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgLAKxI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:53:08 -0500
Received: from mail-eopbgr20062.outbound.protection.outlook.com ([40.107.2.62]:33543
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725899AbgLAKxI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Dec 2020 05:53:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uk+0FAkMxsAhCL0VKaGStDVgC1rDF5/2uDVCEIEAeQ3gDg39+uFBTSMIz/8Kj2v6qt1ZhVGPDyRkBoUIg2hfCBxt/S6WkTaHHOrtwsJDsJyXd1mbJ5IYTqxeMTAWFKVdiD09pVZUetylVmBD/qwAIz/QzpvSPZE3tD/aPs90xGOrW27KRf8AkFMZQKtnNnjKPu/vrVopO2mz0VYrQ9mc7OQP3iOV8bnKQZYREKCzlg4+nEG7LJ3golFStB+olEzV52ya/8XwSqLPhnXmTBUMtya66wy89zrec580wBnWn/fuYUBTf1EyxB12B4FkU7MQ5V4CNy8ctOpUwOtXJEVM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuRSwvVvj+q6im7O11D265EGx+BTbL+AQhk7m587Y2w=;
 b=cVJPoEP+0ZOXEoJHNXPtCgQ3zAEGfDyphRccg/dPiVh1q+GhVuUMGXWzUMVByOzvTAnFlAsxKgMHPIU+4S2TYyLP5U2706D6r1i/tVa+bqwRGWmrf00iwEgYmpMnOQEOmNdbhWGHpX9O01XmLMKq6x+BXVRGE7uPX616pzaCA+A9oz1/VCrYt1DEqBSE+OgLWD+W+tObMuWtpfudhtQdl4tIbv5+MwHj/8ibT1aNGk12AorBcvRbA92o+8h9Ai6SQIceNVURIaerZIYCG8/yfJtvlWwR9+cD5qAIcYtUlZnh4CcpMX8gg6eKunYQIsfVmDDds/LsOFHjqeeyC6XXlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuRSwvVvj+q6im7O11D265EGx+BTbL+AQhk7m587Y2w=;
 b=oWCJ2THRjwDB2PKXWuMSKr+MfXXwXeRCKHKQk+SdYkt2fAr+q5ZczYrvsNTllYstoq1d0XIcyv/HRGKe122HBPxuMa628b9V39xxkAsnJFFJgKZj+2BeTQ9DZkWm/03/5TIT+PpLlWjlF7MESPFijr67qD7FuUSilzPwnu6WDdU=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DBBPR04MB6026.eurprd04.prod.outlook.com (2603:10a6:10:d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Tue, 1 Dec
 2020 10:52:17 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3611.031; Tue, 1 Dec 2020
 10:52:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Greg KH <greg@kroah.com>
Subject: RE: linux-next: Signed-off-by missing for commit in the
 usb-chipidea-next tree
Thread-Topic: linux-next: Signed-off-by missing for commit in the
 usb-chipidea-next tree
Thread-Index: AQHWx8wWyLjOUqW2v02oSux9eWuKsaniDoFg
Date:   Tue, 1 Dec 2020 10:52:17 +0000
Message-ID: <DBBPR04MB7979E47C7D59DAE141CB4D528BF40@DBBPR04MB7979.eurprd04.prod.outlook.com>
References: <20201201212354.3e9f09b3@canb.auug.org.au>
In-Reply-To: <20201201212354.3e9f09b3@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [180.164.155.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2518abeb-3784-4e7c-fab4-08d895e72b9d
x-ms-traffictypediagnostic: DBBPR04MB6026:
x-microsoft-antispam-prvs: <DBBPR04MB6026D4A44BAA495FB25A2E548BF40@DBBPR04MB6026.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kcYwK7u8gxz4mImtn1HVeFWThhASabf42KXNVdc86JqU1jMD/Yy2iaMQCwXa42ipzqa7TPPmoWzP/xOgivTRzK/5lJzU6kf9D7WMvvVfVJrCHjQBVH2DoRHjf0YINhCtWaSKRwL9BBlO1OL3Eaf2kr5xpwViAdxzhbWw5LQZ7MQv5MSF+Wyc5S1z32pMDvIqjbSR8yqiSV6AmihQkQ3s0Y+o7f3n5lrPPBWlJo48JSPveh9Yh4dAfsmb8k1HLNNyykrE4kllk24RRVc28NtUGh5k0C36QJwIGJ1JtWqHezkG6vACyiK7wt2oVFVejQ3IOrTTnuZoT/DpW65ZyXor9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66446008)(76116006)(2906002)(4326008)(44832011)(66556008)(66476007)(66946007)(7696005)(64756008)(52536014)(83380400001)(6916009)(26005)(55016002)(8676002)(9686003)(71200400001)(86362001)(498600001)(54906003)(6506007)(186003)(33656002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BYJH8tEm9fx+cqxPJ0fA1niKMKL9/5pZGXB6JjZVMpWAxPkFz9iYod0MJG8o?=
 =?us-ascii?Q?8jBM5XCuslQDXd4zju6TNtdz2NECUECtK5ewVi/zr0tFXM2BWTjz2X42b86Q?=
 =?us-ascii?Q?ZSlPZbOP0i9Qxb/5mXDEe4sSuDutJp8j9I/4SDEStiOLm/AsLThy8DU3yLqO?=
 =?us-ascii?Q?+jTvJllpnkBL3JXfDjIGbP7QeHOopd5d6jsj+Q9pVWSXQGueB0Y/Ay7Dt9ph?=
 =?us-ascii?Q?vT4UvocStGrEan9+kADVjM+zhD4Y6FZ52NilEqn8+8ZE4eZsFeyXozKUtdr9?=
 =?us-ascii?Q?4xqi7NMtKVz6eaQQO2UmmVEZO6L8An654GpSg6/d7xNRXXhl8NoMdwVRdd5C?=
 =?us-ascii?Q?fwklK/yyXAa6Z5s/3hGyS13y8zC3j3miQAvW9l5/a34RPIL86qEwRrARuMus?=
 =?us-ascii?Q?uiQfkRLHHyow3GFGHdvlsr7DEya5BhPoILf6rakKsDdBUxjtGCizM4ws+TQA?=
 =?us-ascii?Q?bkFuqHCbTZbqHGD3d2EOfBHoS+mrc4vP070lkQOFHPSf36dhnYc28TYWIhbn?=
 =?us-ascii?Q?iINcgJpAkD3zJdJvTZ9uhYkZ+t6LI+YGIVZNP15sTia7a3qGCuMFhGSU3cYp?=
 =?us-ascii?Q?L7pJ9gejHq5tGnrtcilFMtgVI+irt0luzJS4uPHt1ByizvalhxpNx06Vmiqj?=
 =?us-ascii?Q?gcWYatitTXpAAZzUuSc7nzcdnHWB9SG2x9zxuBRPoPE+sd2K/IwQSbkooKgB?=
 =?us-ascii?Q?fKMRnHm8ZrhlvFe3PL9V4Kt2jMCCpORR5mNt9YmumcDlFQip4zxVVuj7vTOg?=
 =?us-ascii?Q?1rs6fB+Za/nFOlpolz0HVt/0SzxcRHAb0nPdeIuYnfX6F8mcdhLGAtkqDVbH?=
 =?us-ascii?Q?NFgtXOEYPoDqfR98ayHufBQsGPIMseq4EWIVbpo/fRw1CN/pzUaEqlsrxOZB?=
 =?us-ascii?Q?0Jw85d93BPEMwuJrTZOLnjo7Wi0TurQQJ22bx+PAtsUhYQNw/EKhb2sHcRpM?=
 =?us-ascii?Q?gEt/I9iYJDYlZyTaOQ/Xcq+BGNmhc0TVOlRJecNMhUM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2518abeb-3784-4e7c-fab4-08d895e72b9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 10:52:17.3657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KuBPKGKES+6BFS5l+5PrJbzg49rZ10upEbH4atj69OQxgCcUEh91qcbh5mWLjO+oknxr3P8CPW6hXGU7tTdYVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6026
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

>=20
> Hi all,
>=20
> Commits
>=20
>   b140b354d127 ("usb: typec: Add type sysfs attribute file for partners")
>   a67ad71c6468 ("usb: common: ulpi: Constify static attribute_group struc=
t")
>   61336e5db8f9 ("usb: typec: Constify static attribute_group structs")
>   f18890ead25d ("USB: core: Constify static attribute_group structs")
>   137bd0e04f46 ("usb: typec: tcpm: Stay in
> SNK_TRY_WAIT_DEBOUNCE_CHECK_VBUS till Rp is seen")
>   2413711487c3 ("usb: typec: tcpm: Disregard vbus off while in
> PR_SWAP_SNK_SRC_SOURCE_ON")
>   38707ad78e16 ("usb: typec: Expose Product Type VDOs via sysfs")
>   581140741224 ("usb: typec: Consolidate sysfs ABI documentation")
>   5b63ba7f3f62 ("usb: pd: DFP product types")
>   b5325e0017d7 ("usb: isp1301-omap: Convert to use GPIO descriptors")
>   9e7290cb419d ("usb: Fix fall-through warnings for Clang")
>   cf8314bb9f26 ("usb: typec: Fix num_altmodes kernel-doc error")
>   442fa9c05cab ("usb: typec: Add plug num_altmodes sysfs attr")
>   1193103c1076 ("usb: typec: tcpci_maxim: Fix the compatible string")
>   13c53c00e81f ("dt-bindings: usb: Maxim type-c controller device tree bi=
nding
> document")
>   f5a98cc36225 ("usb: typec: tcpci_maxim: Fix uninitialized return variab=
le")
>   203fd830a193 ("usb: typec: tcpci_maxim: Enable auto discharge
> disconnect")
>   ebcf6c255080 ("usb: typec: tcpci: Implement Auto discharge disconnect
> callbacks")
>   428804eed4cd ("usb: typec: tcpm: Implement enabling Auto Discharge
> disconnect support")
>   cece16630a9c ("usb: typec: tcpci_maxim: Fix vbus stuck on upon
> diconnecting sink")
>   294a8e667ad9 ("usb: typec: tcpci: frs sourcing vbus callback")
>   1c109ebc0134 ("usb: typec: tcpm: frs sourcing vbus callback")
>   85c16dc068ed ("usb: typec: tcpm: Refactor logic for
> new-source-frs-typec-current")
>   66d004aff708 ("usb: typec: Add number of altmodes partner attr")
>   259fcae90f7e ("usb: pd: Add captive Type C cable type")
>   1090d1e366ea ("USB: apple-mfi-fastcharge: Fix kfree after failed kzallo=
c")
>   44e0bf239206 ("usb/max3421: fix return error code in max3421_probe()")
>   ff5e0488d7fe ("usb: typec: Remove one bit support for the Thunderbolt
> rounded/non-rounded cable")
>   bb328b790edb ("usb: typec: intel_pmc_mux: Configure Thunderbolt cable
> generation bits")
>   235920c3c80e ("platform/chrome: cros_ec_typec: Correct the Thunderbolt
> rounded/non-rounded cable support")
>   9d11b7220dff ("usb: typec: Correct the bit values for the Thunderbolt
> rounded/non-rounded cable support")
>   dd07e75a143a ("usb: hcd.h: Remove RUN_CONTEXT")
>   997d2edc58ed ("usb: host: ehci-mxc: Remove the driver")
>   1261e818b439 ("usb: host: imx21-hcd: Remove the driver")
>   170408f6e69a ("USB: storage: avoid use of uninitialized values in error
> path")
>   2de743b08132 ("usb: fix a few cases of -Wfallthrough")
>   69f7421c6160 ("usb: misc: brcmstb-usb-pinmap: Make sync_all_pins static=
")
>   0f399ba93d3e ("usb: typec: ucsi: Work around PPM losing change
> information")
>   c1a6cb538802 ("usb: typec: ucsi: acpi: Always decode connector change
> information")
>   dcb4ce0e4492 ("usb: misc: brcmstb-usb-pinmap: Fix an IS_ERR() vs NULL
> check")
>   68d6f2bcbfd0 ("kcov, usb: only collect coverage from
> __usb_hcd_giveback_urb in softirq")
>   a7d43316e47c ("USB: host: isp1362: delete isp1362_show_regs()")
>   74bfec445b03 ("dt-bindings: connector: Add property to set initial curr=
ent
> cap for FRS")
>   922a8008fe76 ("usb: xhci: Remove in_interrupt() checks")
>   9b28508e2a86 ("usbip: Remove in_interrupt() check")
>   b3cbc18f80c6 ("usb: gadget: pxa27x_udc: Replace in_interrupt() usage in
> comments")
>   ff6f2b42ea3a ("usb: core: Replace in_interrupt() in comments")
>   b6d8ac49953b ("usb: gadget: udc: Remove in_interrupt()/in_irq() from
> comments")
>   399452b463eb ("USB: host: ehci-pmcmsp: Cleanup
> usb_hcd_msp_remove()")
>   87d64cb083fa ("usb: hosts: Remove in_interrupt() from comments")
>   6a700d8af537 ("usb: atm: Replace in_interrupt() usage in comment")
>   9573d69a7657 ("USB: sisusbvga: Make console support depend on
> BROKEN")
>   3d30c6e0bb36 ("usb: Add driver to allow any GPIO to be used for 7211 US=
B
> signals")
>   e7ed6422dd9c ("dt-bindings: Add support for Broadcom USB pin map driver=
")
>   7f08972e12f0 ("usb: host: xhci-mem: remove unneeded break")
>   8a508616ef64 ("usb: storage: freecom: remove unneeded break")
>   597335205373 ("usb: misc: iowarrior: remove unneeded break")
>   c902d58d8b24 ("usb: host: ehci-sched: add comment about find_tt() not
> returning error")
>=20
> are missing a Signed-off-by from their committers.
>=20
> It look like you have rebased (part of) Greg's usb tree into your tree :-=
(

Yes, you are right. It seems I could only rebase Greg's usb-next tree which=
 I tracked,
but I can't rebase Greg's usb-linus tree which contains bug fixes.

Ok, I will fix it, sorry about it.

Peter

