Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D88D355630
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 16:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344920AbhDFOON (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 10:14:13 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:51940 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344962AbhDFOOL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 10:14:11 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E47AA4013B;
        Tue,  6 Apr 2021 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617718440; bh=2AO0ei04v9FZFmd+vhmXYDsZaYyyUkDIt4tA8AdaULo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=L2mfI8dEJ7cLSszvfFTnu6RD1m2tYh34KHvnQLgruPzbB/aN1vh4owsYAxWKXWoeC
         t5+IxF/WdtIE/sRkyoXGqW0r0CzkPfKND73Ral5sDDg4thn+1ke+F+2QdiguSG1qvX
         9LbBKG8Wmp9K8X0bo1PeEw612oSsVVyV0ounYvnkdAxSCXDO1UyAQ/gmhAEPpN+YWK
         4WKdLfSDxE/FLq3MKSlc+TM57OpaGFJDV9vbHHTxJ+5x+ctLVQ7uwHGtEgPNucGXBv
         ZaB5NqMfn4htzd1ue7mUmYlf7MP1mAGD4yCh3rDg0HlOzfRv4+7EHO0DKTSjCrJSey
         N9sy/TrFN30Rg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7CA90A0077;
        Tue,  6 Apr 2021 14:13:56 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id CD7BE80129;
        Tue,  6 Apr 2021 14:13:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=gustavo@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="wVAYxJA9";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFxEtinvKlgLiImRFblZHuEcNx2+zJ8uDu1/ahGo5qCmqsJoL+zZYbburMWznDvZLZqs2VZwl1JVV42CK5iYQgge5VcQB/Vhy/3ev2FpzbJNWcHy1Bs7SVFL02PPc922KBL3hFWI1G+GtRqgxx9Kw7gq4AjWXvtUh5xuQP7iw94m+2/R/feBupMK2kRXn/uYcYqflbc5EccOS0tr+akZcWongvNyDfrhJYpmzPTzltX3Q36VVtqLbUJmk7JIo3SL+oLjls08DSD9FzLhr1wuEjQ4s6Ug/xARKQSUvKNJ0EIkM4I436Bm1OVg+abQR5FeVqmDY7VnEAr+1Yd29vTt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KfmZxqNuBkrvEsujO/KITb69U3eJ7vJTausKLSkgk8=;
 b=k8Cr0emydoX3pVcbXRueFO9CU5rJaLLb34zhTKWzwQIs9LFMC1Tiiu6B+v2mHpdvfQ8lEjrNggy0mY0W+JiRcwliXIUa2TgLkv2HMOYFf7m9TzNghvEic7lghSoShQAgbBl6kjC8odJMcUo1tPC/22inSmSy2pccvA97iYxiLgsJpntr0NeFM/IB38i0f66MwSBNk4w5YF9KB/+9ch9Gq0g+sIBa2uihxDKUxdWMLdtZD7iuOEOIxORk2yZpRuDfbOBQ7ZBQol1AZ6Kn10rhh0+k1mukkxRrn46U3sFCloVhNiBzw3aEWh61DDq6ZrKFsKnWvj+cQFlsDCnMU8TMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KfmZxqNuBkrvEsujO/KITb69U3eJ7vJTausKLSkgk8=;
 b=wVAYxJA92GUYHKZO2c8c7H8MHJ1KJIaUl5Mu9z91zleXq6aq1JOadkbvm1y0bffA5XbV5H9+f5O/xzCdaSFH98DCut2LvbCyBrWF1aag0l0VSRneISq+3t81ODA96bZkrt+G2gO2gksE2xvZBmHRDkYKgQdRwna6BhFN3b2whJA=
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM6PR12MB4828.namprd12.prod.outlook.com (2603:10b6:5:1f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32; Tue, 6 Apr 2021 14:13:53 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::5e:b693:6935:78cb]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::5e:b693:6935:78cb%12]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 14:13:53 +0000
X-SNPS-Relay: synopsys.com
From:   Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
To:     Greg KH <greg@kroah.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the char-misc tree
Thread-Topic: linux-next: build warning after merge of the char-misc tree
Thread-Index: AQHXKtpEGtOXC5UfnECr/0FDbpKlvaqnhp+AgAAAg1A=
Date:   Tue, 6 Apr 2021 14:13:53 +0000
Message-ID: <DM5PR12MB18350439051E4E90BD0287F4DA769@DM5PR12MB1835.namprd12.prod.outlook.com>
References: <20210406214441.5744648c@canb.auug.org.au>
 <YGxrG16+8n8Wxs/c@kroah.com>
In-Reply-To: <YGxrG16+8n8Wxs/c@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcZ3VzdGF2b1xh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTRlZThiYzkyLTk2ZTItMTFlYi05OGVkLWE0NGNj?=
 =?us-ascii?Q?OGU5Y2YwNlxhbWUtdGVzdFw0ZWU4YmM5My05NmUyLTExZWItOThlZC1hNDRj?=
 =?us-ascii?Q?YzhlOWNmMDZib2R5LnR4dCIgc3o9IjE0NzkiIHQ9IjEzMjYyMTkyMDMwNzg5?=
 =?us-ascii?Q?NjM2NCIgaD0iV0tlN1N4ekRNTjMwcUVmSU9OK2g4REZRZHB3PSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSFlJQUFB?=
 =?us-ascii?Q?czRHRVI3eXJYQVp5TFo4elV2TzRHbkl0bnpOUzg3Z1lOQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQUdDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUFDQzFsQ2dBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
 =?us-ascii?Q?QmhBRzRBWXdCbEFGOEFjQUJzQUdFQWJnQnVBR2tBYmdCbkFGOEFkd0JoQUhR?=
 =?us-ascii?Q?QVpRQnlBRzBBWVFCeUFHc0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCbkFHWUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSE1BWVFCdEFITUFkUUJ1QUdjQVh3QmpBRzhBYmdCbUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QnRB?=
 =?us-ascii?Q?R2tBWXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0J6QUhRQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJn?=
 =?us-ascii?Q?QmxBSElBY3dCZkFIUUFjd0J0QUdNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFH?=
 =?us-ascii?Q?OEFkUUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZFFC?=
 =?us-ascii?Q?dEFHTUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR2NBZEFCekFGOEFjQUJ5QUc4?=
 =?us-ascii?Q?QVpBQjFBR01BZEFCZkFIUUFjZ0JoQUdrQWJnQnBBRzRBWndBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQWN3QmhBR3dBWlFCekFGOEFZUUJqQUdNQWJ3QjFBRzRB?=
 =?us-ascii?Q?ZEFCZkFIQUFiQUJoQUc0QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUdFQWJBQmxBSE1BWHdCeEFIVUFid0IwQUdVQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFiZ0J3QUhNQVh3QnNB?=
 =?us-ascii?Q?R2tBWXdCbEFHNEFjd0JsQUY4QWRBQmxBSElBYlFCZkFERUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1VBYmdCekFH?=
 =?us-ascii?Q?VUFYd0IwQUdVQWNnQnRBRjhBY3dCMEFIVUFaQUJsQUc0QWRBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QjJBR2NBWHdCckFHVUFlUUIzQUc4QWNnQmtBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUEiLz48L21ldGE+?=
authentication-results: kroah.com; dkim=none (message not signed)
 header.d=none;kroah.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [89.155.14.32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9e1993d-0ce4-4f8f-b267-08d8f9063557
x-ms-traffictypediagnostic: DM6PR12MB4828:
x-microsoft-antispam-prvs: <DM6PR12MB482815D99CD0817C8EDC5414DA769@DM6PR12MB4828.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RYB+cF1uji/IQBZuqwVYYlbDXXeIDz+mFSy5g1kwDdJwtWXGltKO65aw9+DkPAi8xkDAj/RMfja41JVSCDlJjsu3x/qN8hN6P70iAgKdr9E8/rKJbn4xm87+AEha+J8kZp3yJwrgnDuVlmO236RNYo+Xpc1UaEjNwy+/q37/9h5bfUDCpygnMaN2S9eKDp2U/qXkWzWetOssmTH5S+/U8bsKWR0kmxVInOsdqk1BTFnIiMrGOBRAvkFU8xCfyBrb33yqzYGCQkdUd4DM+/6ot2TJnha2FCjUuwcoSHuGogEbdC+l22OqDGqQ16tI6W1J20uD+E6stsd2vnM2291/CWkF//Kd0AsRJ2VtKoQWqaAoBFaepvDzEQupJEqXeg2TNB6CpDr29NQV2Vnn+Gdq08cU2rj5sSx/JisCVjczfGZ9tdCmMtHe/ZXD3j9CeSK8gkPAO1xn6EIxHru9pCenzHnU7KjYsZcvDuDxLtjyvprHEB10uG8aI+pagl7TLi5kUQb6jPx6gdvS0vZdvGdi2IbaSXsU3iyljnnitFlUE5JqHzsDZI3JOHX1R4chjOtaHBhL6ZRVSzi9Qz5Wo+98oQljtyZaCyqHo2ugqKCB2J1t7P7rzs7YS9XRbODKc8GXOe6/sAX9V0cDul4FQVVk3j2eaBJXDxQG++yZvK4evHk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(136003)(39860400002)(376002)(8676002)(83380400001)(64756008)(66556008)(7696005)(26005)(76116006)(2906002)(66446008)(86362001)(6506007)(478600001)(53546011)(66946007)(52536014)(66476007)(6916009)(33656002)(186003)(5660300002)(9686003)(316002)(38100700001)(55016002)(54906003)(8936002)(71200400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?7b5Q7Wc/LHuNCCgS/qeziiZr+Mx27VXpW67eDgQs896WDtrD8B4eivP0G6US?=
 =?us-ascii?Q?iyQSDOdhH0BkTR7wuu0Xs7EDUwLUuLettScpE24ohwXxqzjj2268xIhdmtWt?=
 =?us-ascii?Q?u00pkNiBDCzUcEGk9qBdp24iimNfMNN3ypXm5+20Xq7Zm2SaXEzgezjqzqyn?=
 =?us-ascii?Q?TZyYYM+aoCOtM6lGE+zn/SNgTR190C0EpxzC+NV4RYK6CuY9FnIfd+pnF6Mv?=
 =?us-ascii?Q?6HfkKBbWtYiOjvttuZ8jbQmIeq0xZOZ2aXyQEjonQozLFdNc8vKP29+5KxHM?=
 =?us-ascii?Q?ResOWquqcFO3RIdNSAfR/WLpui7HMUdz0/C7hL3F+V1O5aiIMR0uvwFZpehV?=
 =?us-ascii?Q?6TpIkbXLmyeMtRSfJoRCQX46vumWPSE+qfZZ09yI3SgLH9yIqCk7tV4xzXbR?=
 =?us-ascii?Q?HDOIIQDBKdNbVRc1tD7nnP/nFsdMN2qpuNqUPojd2uh0GCFPelwgRPdrptv6?=
 =?us-ascii?Q?lnJtSMVr9POzU3J8c9G7iU4/wGYHvucB1donHnGHuoYwdV3xs2/WvGXJz81+?=
 =?us-ascii?Q?Z2vVC6lXPb7eIoxUFBBkH6gJCsVwQdG4IeJGNBGkv/tcdsjTrPg+FF/WL7KF?=
 =?us-ascii?Q?n9oFTwhS8CBQbdkDVxcrvrnNs9hLDwQVAlYwShT2/n81SWMvb8ptvG60QB6E?=
 =?us-ascii?Q?wPfNPu+lF25iRR9zyD2e/6JbjQAmgI2FNZUqifkWGAiXJiGQjnD02+wlI+/r?=
 =?us-ascii?Q?Owu1SyNdXg4KQ5yFM25ZpFOLW4mDtn0dqFUPpf564bvRLAjstvaIMyFzb5m8?=
 =?us-ascii?Q?7GqHfBsk41nSrC0TaUtwwzxu97UdkRJ+fHB5XYKfC4fDSSYh7EX9xp1Kpe+4?=
 =?us-ascii?Q?tFsYnewJxbI6OXvAPALD8wkax7mbArwzYTdcP+YgpdrxRxY8x2ZeQ1hBmyId?=
 =?us-ascii?Q?0NohqTDmwCQsLtK1s7m4bQgbQy6eJP0Z6FoMb8ANX4KeRhnzMy7JToFcQyIV?=
 =?us-ascii?Q?CAqOFjpN7zsivxflvFn/8ZY3m+mQnEXnkTkk77JpBYND0noJPQNu8Ktwfr2J?=
 =?us-ascii?Q?maNoE/w2sKPRRsKrdeyiC5rQYqVdNIXqp42tvgdWLtl2i272gQsWiX+nhRY+?=
 =?us-ascii?Q?uSsn4SO8DHaFT2JBeqtQ5IGt+lhv8qe/juFCpRzsAprlrehG4Or1wOSTjrIi?=
 =?us-ascii?Q?SbESA3cbv0dVDZV/G5Sq7ZTdAiuas3bSgvBhO8a+HDcmwjYlh3pvwjhAMbKi?=
 =?us-ascii?Q?MmPJTnLOgZXNkBxvDF3MaH7qHeml7p35jQ7Xq6PjWAl7uz7V6p4WTzPXz12E?=
 =?us-ascii?Q?as724q9miTfo1RabzwoDMP24FZXHfLM3SRzKvFql6Bzy4yOWcjCyZkn5SfTU?=
 =?us-ascii?Q?uxg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e1993d-0ce4-4f8f-b267-08d8f9063557
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 14:13:53.1295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: koSEYmpLmpGDoMcV+rhC/iO5WRmoG/9l69Jzx8M6RKyJE8MgmMvVXXItxzOEVhf4c0crdK84PHKYcPC9Zc4NQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4828
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 6, 2021 at 15:7:23, Greg KH <greg@kroah.com> wrote:

> On Tue, Apr 06, 2021 at 09:44:41PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the char-misc tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > Documentation/misc-devices/dw-xdata-pcie.rst:20: WARNING: Unexpected in=
dentation.
> > Documentation/misc-devices/dw-xdata-pcie.rst:24: WARNING: Unexpected in=
dentation.
> > Documentation/misc-devices/dw-xdata-pcie.rst:25: WARNING: Block quote e=
nds without a blank line; unexpected unindent.
> > Documentation/misc-devices/dw-xdata-pcie.rst:30: WARNING: Unexpected in=
dentation.
> > Documentation/misc-devices/dw-xdata-pcie.rst:34: WARNING: Unexpected in=
dentation.
> > Documentation/misc-devices/dw-xdata-pcie.rst:35: WARNING: Block quote e=
nds without a blank line; unexpected unindent.
> > Documentation/misc-devices/dw-xdata-pcie.rst:40: WARNING: Unexpected in=
dentation.
> >=20
> > Introduced by commit
> >=20
> >   e1181b5bbc3c ("Documentation: misc-devices: Add Documentation for dw-=
xdata-pcie driver")
>=20
> Gustavo, can you send a follow-on patch to fix this up?

Yes, I have already made a fix for it.
My apologies for my ignorance on this matter, there is some way to check=20
if my fixes are okay through some script or other way as Stephen has=20
done?

-Gustavo

>=20
> thanks,
>=20
> greg k-h


