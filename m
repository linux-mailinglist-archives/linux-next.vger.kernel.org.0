Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB22355A61
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 19:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbhDFR2t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 13:28:49 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33720 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232752AbhDFR2t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 13:28:49 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1F789400F9;
        Tue,  6 Apr 2021 17:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617730121; bh=NgStwi2e5luOWvpR3zV067zmrqiAlOzoGvIXxw5zIGM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=W0tToHiuaB/r0lPpgp15swmVm+EHWG6mivIfegwQnEQFywQAjFhYa3v4cH5iXmwcc
         sSA3Gx4Vdlv/2e/v18gIRft/yD4UmN0nZRrTioOmow3xXJJ9d2qWKDhvyGFK0m0uE0
         LAA/j4OnQ3bXKqGEPn+G1ddITSQkOR6BJYkI2UxH30NWSiUFi7zAC6JDb14M/En03S
         8sYcOMKJT2XBn5mbUvlgn6AZ6zAmkcy3hyimfqzBrV322wz6XiC3mX1zAsViaDzgLq
         EUKhe238g8CqwyA+wgVidqLJmVPEhrJ+meStuaCVRGJOyosdNF93kqCwv3zHRsyC48
         mpbOgIu3ZsGkQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id CE2CAA0077;
        Tue,  6 Apr 2021 17:28:39 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2C2D280129;
        Tue,  6 Apr 2021 17:28:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=gustavo@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ieWmb1tV";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU4KjA8v+5Y5Mc59SmZw6F+L4zO09hicmSQpMjubAPKNXd+S3o3lF0dCKHd06AnVdQeg8DtbL0KtmwKTDd5J6aHUsXJsPSjAYipe1mqEmeWZgMQJBWRLdNcfm71+vnXhnTWoaq0IYIbbQXxf0+n9BUrwjOSdmm5XvfG4AwukeIVms2MvIvtgAeFIkpCmrAh+/oTyqZkM6ZPecjU9R1qz+CoE5q7nW18mbUycqt/fCpvp7t0eCCyOc70dX9J7319X/32LzEiXJYGfc6jjpIw60TkvqWqzWNP2X/n4wLM+wdv1vxYI0hYXqdqAm8JGKtS4fjSXsLJK/jKvwI4qxgdVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUuqukuq78t05hBnfHo8qzI1sEqnpqunC8W/OVghby0=;
 b=oU4RaWFIbsUnFVvaLPE55HIqrmGNr+ytJJX1ZYWe9Xmu0njxR/7jXDSXbEV7DXg3P9Ue1eyP8pgDnheNN2hFRtD5PZxpXMP0aJ+ia7UX1hKm7cfChDbhR3fpdrsaSByKlzP4n2Wo1zdheMzC8sw9PncWeZdEl31sAlZkpxcGlItcZP3nzfZXpq/ywO4bGQUHRVTuIXlZtV6Dg8OrWCRqD+027h692aLe4iX4lRSsge5pcs4RAGSgWnRszQcgjJKu1dY46PuImXvKOCUJeG8CXJ52CovA1qa14eHW2de2WEwmWxnjvxhC7dEe5OrQzV/bHonlO+l3Gn6NI/wGhFWNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUuqukuq78t05hBnfHo8qzI1sEqnpqunC8W/OVghby0=;
 b=ieWmb1tV5zLs0q7ZkcjpNnlCrio4Hwg8Ank+t/ffuGf2vmAXlsHOPo9w9gsudgLX6E8fnEazqYGWbOARf0MSPhoi+UVLokQZUp5ReKLE02IULyI8YZYVWhYat0ZidlXEK5YZwhQ9bE/RsWknUk3lMqBBQRnTh/qaDfczx/7/S0I=
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM5PR12MB1866.namprd12.prod.outlook.com (2603:10b6:3:10c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32; Tue, 6 Apr 2021 17:28:36 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::5e:b693:6935:78cb]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::5e:b693:6935:78cb%12]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 17:28:36 +0000
X-SNPS-Relay: synopsys.com
From:   Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
To:     Greg KH <greg@kroah.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the char-misc tree
Thread-Topic: linux-next: build warning after merge of the char-misc tree
Thread-Index: AQHXKtpEGtOXC5UfnECr/0FDbpKlvaqnhp+AgAAAg1CAAAHOAIAANb4Q
Date:   Tue, 6 Apr 2021 17:28:36 +0000
Message-ID: <DM5PR12MB18350E4A7E4207611F9C93CFDA769@DM5PR12MB1835.namprd12.prod.outlook.com>
References: <20210406214441.5744648c@canb.auug.org.au>
 <YGxrG16+8n8Wxs/c@kroah.com>
 <DM5PR12MB18350439051E4E90BD0287F4DA769@DM5PR12MB1835.namprd12.prod.outlook.com>
 <YGxtDDm7nV1AuTqo@kroah.com>
In-Reply-To: <YGxtDDm7nV1AuTqo@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcZ3VzdGF2b1xh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTgyZGJlYjgyLTk2ZmQtMTFlYi05OGVkLWE0NGNj?=
 =?us-ascii?Q?OGU5Y2YwNlxhbWUtdGVzdFw4MmRiZWI4NC05NmZkLTExZWItOThlZC1hNDRj?=
 =?us-ascii?Q?YzhlOWNmMDZib2R5LnR4dCIgc3o9IjE4NzkiIHQ9IjEzMjYyMjAzNzE0MTQz?=
 =?us-ascii?Q?NDY5MCIgaD0ic0l5UHZjUGhvU3BoQTFlN1J0SVlXVTAwQ1JFPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSFlJQUFC?=
 =?us-ascii?Q?Q01UUkZDaXZYQWNzdGRWeVFESlJjeXkxMVhKQU1sRndOQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: e1125111-ccde-454f-8ce3-08d8f921691c
x-ms-traffictypediagnostic: DM5PR12MB1866:
x-microsoft-antispam-prvs: <DM5PR12MB18664BF92E01E1973F25C9D8DA769@DM5PR12MB1866.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: alPARsWTa/E8v4aEsVvHQeOaNOxJ1IWaWWPmszW/5J39WZnGPZyDJUQpFsNYV5aMAbjrkk7+N81WVvmJz7sTxfGsr35ILtPFPNpver6lI6kp6gYJ61J8WB4P5bCxbJS3vjoh9pRgitdicOiZwE7KtfYWJ+GYBuQErYxeD7ptxYjtmscukMd/uxaLbVDFXRX3TS0g6VRugCGXuBAy6zNIfAaoXjfaNOwOoiBFDGsAPJX0gL8eK/go9gThCbxV456vKaa/2RIA+NnGto/dpobgm+Ls2b8XjrNL2CBtOlG4qq8hBvC9XSVYvTjK5lNeKIuKg7fsqu/KTRAhXLi3sUis5++bjaZChSS5GWbOLM2Fv2ZcA2Hidd3a1XYbOkLq3eW5/K5ylMx09/dgCo/CZdOeMRs3dEUGTq7ggn8EiiAzSsncL+QnZK3Rs92J22VVurrxxf3Nz5TKxZR8F+/wpX4ZI3mFVzM5TjyNT848dekaREBjj6n0ZRlyyLZx633pH06VCeLFE9rxVCOAhMyRAW/Jk9GoZ0tKNM+weS4TzMgs7xfA84zw+2HQJof+lt5bK83R11SqKEDssQzxdOj77OsuNXcOnqmYYtBltjEaDf8ujwWgnaHBlhSk1PGu8FQAsZ5y025TyRskNQnm8aqAuuUwXNoIGZ/RaHGPeg2s4GWBvlg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(136003)(366004)(376002)(346002)(52536014)(316002)(26005)(38100700001)(6506007)(5660300002)(55016002)(54906003)(71200400001)(33656002)(186003)(83380400001)(9686003)(76116006)(7696005)(66556008)(66476007)(64756008)(66446008)(53546011)(86362001)(2906002)(478600001)(6916009)(66946007)(8936002)(4326008)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?w0yJ1LwFYUliEyTDOcL8DBXsLyfQe50ShA+t9J4ulOVwXwsE3sPWKGRVPUyg?=
 =?us-ascii?Q?MBjI23MCtl+Ud9/4OrreNvnzACCUO//wCIaLbuMnBSqkRC2VD1GunqDMCi6z?=
 =?us-ascii?Q?KpnS7RPRn3If5q5VwvxdEYJsre1kTOluTRoBnpYe5KTDm1SYA8A16W0jvAQC?=
 =?us-ascii?Q?btc6V7d1b8LkPy+2raiRUJWsu+jW/6VqQZg5tCk2y/JCHqHk1CZhscDI3ql/?=
 =?us-ascii?Q?4XXt5aq9sr+FXvsfBu/zKapuamBYofqccsbFnS1D7P0j4iuaZV2C2MOYzNj0?=
 =?us-ascii?Q?W4YDxlrCykZc9usEsQ1jMrcsYswAMJv1FshFGvykwR8fTl3RWUarb6Ad8+gq?=
 =?us-ascii?Q?upwYVpF9lT1b7safa7lJpMU5LwPHatQE2y/hWGBxyuxmbd5tFOh56vWq2Z4R?=
 =?us-ascii?Q?4lRohIVIabTNQWf92woYtspBlx3ASnbpvup1tGePy4j7IfPGLkZoyBhbJMF+?=
 =?us-ascii?Q?2BIZP+nsYbGNgwmGBlR39zlb6jlBkcWYK80/rLUcvgRqkJ8HnjRrf4D4gV7a?=
 =?us-ascii?Q?qgtaS59Ajepi1MdnVY0Gwyi7hDVchVyXdNA6tDWPIPRSe3ucrXtsq5508e10?=
 =?us-ascii?Q?uASyfuIuq0fsAtI0pb4SDL06GxnMaG249yFBJ9DOb67Oi8fXCtuDl7++y0hd?=
 =?us-ascii?Q?74owUeVYLLwlSN+wQhq/Uouk7ZlZQGnH6u8vGZrfKcNOKdbzmH4QSHoUn/sb?=
 =?us-ascii?Q?MRt68bZGkhTX4TBfBoPigREP8m8hVwgZQzNlfcIc1zxdQ9Su9xEwX6yj+8/G?=
 =?us-ascii?Q?UzHYW5kGuDbVsd7d2akIXBscbvnWIsFkISoeuSKI6R0V6VaSjnGm7zAcWvHi?=
 =?us-ascii?Q?7taFhdOudXHmPFyFngNxydaS8eAOPmggO5HZ8RjDlBb/w5OtK86KKOyS+l4J?=
 =?us-ascii?Q?Du5flTICEh0eK+KoTtESm8WlP/3AOMAncZkOIjlgnwV1aA+r4rZFY7UMNafq?=
 =?us-ascii?Q?MicQ2sLmOXaLGpDsKvBs3ZbM/9SIGujThkWeulP7ky70LQt5rKXDb0zu1Aw3?=
 =?us-ascii?Q?ziU9Wj5TaRmPFZuUv4jDqRoGlAZjvdNKrjVU9PfXU8rPggGK71g6VSh5zypV?=
 =?us-ascii?Q?y7Pdwt7dNLTtZYvoKAIyQybwqYAVZT9hnsP4MrwsbMdBaD0Q4ciaE3uWeosv?=
 =?us-ascii?Q?OzA804h5wSalSuK4akFVFlJSnE9lD7qW4JERvcERqbhWMmU2D2E2gAujDJ8z?=
 =?us-ascii?Q?jntM40eKXv3iManAnw5I2V2cTf1M1BDYa7704BZOvy+1qtIa4kAijLp1Kbjh?=
 =?us-ascii?Q?IlckHfSG2HtRbZgdNMOICVzk8BYd/4X7lEkjZc7vVxbERgVsErIK6WLrCjm5?=
 =?us-ascii?Q?TjUlLirOuEZnl44kCjpD5X5v?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1125111-ccde-454f-8ce3-08d8f921691c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 17:28:36.4331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwFjt8rgHOHn4666E5f1V0+5LJ7aigIyZPT54/T24BsyfwNh6f0BrU9we0JkxLcjOlnCBgmSzBA6F9Jr1IfT3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1866
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 6, 2021 at 15:15:40, Greg KH <greg@kroah.com> wrote:

> On Tue, Apr 06, 2021 at 02:13:53PM +0000, Gustavo Pimentel wrote:
> > On Tue, Apr 6, 2021 at 15:7:23, Greg KH <greg@kroah.com> wrote:
> >=20
> > > On Tue, Apr 06, 2021 at 09:44:41PM +1000, Stephen Rothwell wrote:
> > > > Hi all,
> > > >=20
> > > > After merging the char-misc tree, today's linux-next build (htmldoc=
s)
> > > > produced this warning:
> > > >=20
> > > > Documentation/misc-devices/dw-xdata-pcie.rst:20: WARNING: Unexpecte=
d indentation.
> > > > Documentation/misc-devices/dw-xdata-pcie.rst:24: WARNING: Unexpecte=
d indentation.
> > > > Documentation/misc-devices/dw-xdata-pcie.rst:25: WARNING: Block quo=
te ends without a blank line; unexpected unindent.
> > > > Documentation/misc-devices/dw-xdata-pcie.rst:30: WARNING: Unexpecte=
d indentation.
> > > > Documentation/misc-devices/dw-xdata-pcie.rst:34: WARNING: Unexpecte=
d indentation.
> > > > Documentation/misc-devices/dw-xdata-pcie.rst:35: WARNING: Block quo=
te ends without a blank line; unexpected unindent.
> > > > Documentation/misc-devices/dw-xdata-pcie.rst:40: WARNING: Unexpecte=
d indentation.
> > > >=20
> > > > Introduced by commit
> > > >=20
> > > >   e1181b5bbc3c ("Documentation: misc-devices: Add Documentation for=
 dw-xdata-pcie driver")
> > >=20
> > > Gustavo, can you send a follow-on patch to fix this up?
> >=20
> > Yes, I have already made a fix for it.
> > My apologies for my ignorance on this matter, there is some way to chec=
k=20
> > if my fixes are okay through some script or other way as Stephen has=20
> > done?
>=20
> Yes, run 'make htmldocs' in the kernel tree with your change applied and
> see if the warnings go away.

Done. I submitted now the v11 with the fixes.

-Gustavo
>=20
> thanks,
>=20
> greg k-h


