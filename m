Return-Path: <linux-next+bounces-6107-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F20A766CB
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 15:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE5B61886201
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 13:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B780210F49;
	Mon, 31 Mar 2025 13:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nl0a1+BN"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A321B17A2FA;
	Mon, 31 Mar 2025 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743427487; cv=fail; b=gmO26wHY2O4n1vYEB4V0jVEYp+dXZNWn1YSZgoIP7oNc0gJVCHT5Hnh2nQXNypRyOmtYPkpMjz/qmKLFJBoIpRU+grxFfc3AO6T+dTdItTFH8HXtr8vErsiBSvQdZ/fOCHjNEaNfKcegYlnVoqw0uTXTbjRxrvP5h4S9k7tEZj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743427487; c=relaxed/simple;
	bh=wqsMFUTsKIo1KwJRh3UjxZC34cj/DVs0rKJyyfCGa+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hzSPBRIPna4uucAJK8+F4WuC88+NoxszPoBy7nbMM9pT3Djkg+ehn8AnXUO1MvzD5PV9BYQLk12un5wX1vnTmR9UKb/w/QIQV9jx5xN5+7bQLBC9irAgfK7pOt6Z6O1ovBuQw6lhtSeas7n/XRm3En6CN6tkE6EBnRfYg3unaYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nl0a1+BN; arc=fail smtp.client-ip=40.107.243.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRuptyWj6Iad0yTAZGW7s35tPM1+Pm8a6erGJrNzDyPCLx3ksyLbR9yXA+vNaQPawhoIiIyvDN2H3IwuaMr+nkVlMqo73NlOt/gagkUItT6mmDtgvpkczTfvrUzrzbgEk6o1MyNYvQycZF85EYJMKd1OyQtv6jA/oUixClLFL0mhuBH39nhuJwZ/aKl+0nP5npQUvFnoRLRKDkNQVHWVGxxu9ssqiY9qm9W7zT0j0gD2YQELfpYYX+g/31M+oi4zDW/UOXXPRbXgChgNe8a4cTnFwaX96gch3fYWwrVy/ZPdlA7DVsqEv+LK4gHm7O2nKZe8m4b0bpyw7xNHH2mf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvgGiB9rlmTfutYznaUu7f7WJOUPGT0+r02OzBvuL8s=;
 b=q/nW3tBZXDIhP4QMxE/C8zTOZoI1hsvq0AU7UvqEfCZ8Y5WC1waDT63bXE1w/N0Ni+K7Qja1Tnq1BucpUSIJZLbkp/RnU4OysdCBkN/j5ED2mPKHl1yc6vSME+ZtqIHo2t2cjfZcyOjlPGfUOmbd2aiQT6ehR7c5+QsnOC1ftE01VRoCXrCrkaV0+Qbp9aJrQ/fLmhwRgvLcy0I/cvm5uxI51/yyyOX/O7NDB2rE/PFq1v1oGwtNI+bdF7XEl+YRFAaj+raxKn/yyAi5vS9wX7TPLnWMnxzVlLXbqFvEVOF9fu1wfEAB6kecyQC1FzZ1XOtIQBIW2wLk6aFqKOM8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvgGiB9rlmTfutYznaUu7f7WJOUPGT0+r02OzBvuL8s=;
 b=Nl0a1+BN2JShwOY6HbES2R6awUU98DGEYTAZoOYBsbUwPIWh+BidilGZU72uv1qj8e4ajGiyUX2RCVGJORarroV45HQRPoJc6FX3mGVMTLlpa2iYJCSJKlJFQCgKf//h6ySoiw/tYvBU87/ofBmYfKP+7w+j6hB39EEg990t9zmHC1/yccKK9niK+85Fe7/q4ObdLQAq2NNczvOLfXwu4G/jtWIUpJHHTQXOGcrd4m/DKe0bgfxh+lFJDbjSgceH1V4T9sd0JNKM15S+DG/qO5lWbAgew0dnAcXZVdLeFiZ//wR77n/ApRgRVXgVXqx86/NSWyyLYMu9pDZhR5PKDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 13:24:41 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 13:24:41 +0000
Date: Mon, 31 Mar 2025 10:24:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, linux-cxl@vger.kernel.org,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, gourry@gourry.net,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <20250331132439.GD10839@nvidia.com>
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
 <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
 <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
X-ClientProxiedBy: BL0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:91::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b76caf3-a68c-421c-f2b0-08dd705764e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qxiQKUXBSDTaEjhaKJNOTR7uH2Orn7l94khiRT3f7x5DcpOj2t70x1U5l9i+?=
 =?us-ascii?Q?b1ToeZPB5IRyJxpRvyDIVzHRW7FX/ODmbLo0U7zjhaDXW0H41r9N9bMXQKkB?=
 =?us-ascii?Q?rjwGeKZ3LrX0UwoFSwJXI3is5VxpTCyQjeJXN3tA8sQ/RiE6GwqaIWsZYoPi?=
 =?us-ascii?Q?8LljRx/HI/atlbDODUJzkFU/8OYEiXIQyRroTe+E7MHGvQboG3770848dlpZ?=
 =?us-ascii?Q?RLAUDQTiXBobiGTGNVGRKxyJHi3kDw/Zl3TTKod89ChsDDi9L/Mtoaf3ABS6?=
 =?us-ascii?Q?Aq2AliM39AMNOyLET62arCGFmzC3qDvqLfZrT0psRloaokeX448wrDDe04Mt?=
 =?us-ascii?Q?3PXehevRR0YVIF+XEkv9Lq08Ga5C0vA4biKxUZXDcM38EEjUfawuzISttsL0?=
 =?us-ascii?Q?eiaEsLivqNaucYjg+HuNDMV4Ziz1Hh2gbi0/cbme6HyCviGJCaKE8Ma6Murl?=
 =?us-ascii?Q?+szdgj5UGfjNBiPZtlgi0m3HUhLocjSyCACxvZBMjlhwLN5XsWloOwmjbplv?=
 =?us-ascii?Q?JapYP9d8ROIEgiK7eqt89XeDRucs2P2jRhz35ZXdw3QQAFxsjiNOEbw5iFKE?=
 =?us-ascii?Q?WiyctU9cVavYifzj4sLVjnZNVa98e88cgylwhiu48EofbrU5fjoXEJUINOqc?=
 =?us-ascii?Q?aUCDfNWlxDLz5OR6lXsIOhXC5wb+zxaQbWpTLGzMGmqRzQk4DjiMOlHBlM4J?=
 =?us-ascii?Q?1aL93KP5/T7kjyrWJrGQLA7uS9L/KsmyLcSdY0+8o9eVP2n54L0k6gO+6dXQ?=
 =?us-ascii?Q?dc6yv70YNVhm/Un2RpXjFiHiUUHwytuVW/qMxgb8iou1cgawKIoc1u2XNwo9?=
 =?us-ascii?Q?aXHbqJWR7v+KE9MPpi54qAW5Lz4BFxw2xG6kq3huAxveSOaG/NEpHic1k118?=
 =?us-ascii?Q?9gtKkcp7euzNJJo7ZhLWEutomJdxbgFG/pVXr5zzlEXgszawDiPY3/dYhD6C?=
 =?us-ascii?Q?zU5Qvp5tf0DS/IITvJOnWw1AnCwPKmWQyhQ4EFvN0Ihw6BLonx29Xv9iRCA/?=
 =?us-ascii?Q?yIaUUcYuxJ4ZTNfq+n1taSkTPJ+cj+CniKfA+a9HI2J8acfGBZzlgy47m/wH?=
 =?us-ascii?Q?qF7rpZaO2+qqrklHYtRUmVeC/3j45RsAU6Oc2wBZ3h/RcjqmyB59/adCM2kJ?=
 =?us-ascii?Q?4JXhBwI0Mh3vbSug9i8xhPgVJ+7hsvmUGloRvpPTg1qrkQID8bbJIDcSlyhX?=
 =?us-ascii?Q?g5aUnFUM/FtQl2CZh1h9+oobCzgIidQ6oDVztaG9Mwzdy1rJoQePfNwRw1IZ?=
 =?us-ascii?Q?NgbZtsLvQCDgfxNwXlTwQGmtFjFDl6GPez83HRoMuSjFBLkurVWd5UgksaL9?=
 =?us-ascii?Q?fBp7fuTeWYqU/JMpGv0G1v6H9E/5HAAbSwgZAwnDeGfF+O3ySv8JDfjB6rRr?=
 =?us-ascii?Q?NKOTEoHEh/HyROPwAEahg936LXhH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0P/eKrHyvTBN6Zrw+tYc3vKQvYpmPySr8PhnSsXJd/4GsE6ANV9WLHhy/pQK?=
 =?us-ascii?Q?rV7Z3duF5++IBDKIj3/L62mJwskXRYzWrSq/kfUGnzVViEFQEIJGWgPcFD5t?=
 =?us-ascii?Q?cEFk+ljBFLh++EgbbJbp3UkMBVX5Q1uJsgaiIzD//Mw/I8EANKf7tMMLd8wL?=
 =?us-ascii?Q?qc2rH+t8ACM/VfElC92W7tIj7398a4vC9Wm9sE/iX/DRU+MLon0bwYpyqJll?=
 =?us-ascii?Q?9zH+vob28QVxCH7pRk2I9kLJh2/PoioLyb6nQZ/siFqxynIBji5mXaT/BDtq?=
 =?us-ascii?Q?itWDzQR82aE5hxg43V+cNENzddCFNKpvFNdMDB1UhxGU0P+MuJMHDskDmWpt?=
 =?us-ascii?Q?ArFANRN5lJMsJdOod37/xjY2TL4HP1lGrTW59Mb6kW2Z/vAlSfGjkkzZy3B+?=
 =?us-ascii?Q?08yF8JCB6P+VKx96rTgb+YBSGZlzpVLaifbxJPj0YKq26xYALQlcaCShJd9M?=
 =?us-ascii?Q?ReJKRtb/vYXZZkHZBqUicqGrOW95bSuK8M1c4aw/LUQu4gGipZKjM5AQVr2N?=
 =?us-ascii?Q?Tb//mlC9KpCsGpmDI7fTE0IbpX/NANb7icpkj5cWLLVweK8hfvaawN5W1CIM?=
 =?us-ascii?Q?a8WBsA0MmOx02ePMA/30aHOhZLhTn8MbbbrH/A/aNdsjjlhasqJdoSUoP0Dr?=
 =?us-ascii?Q?gu+RFfqE1a7No96GRapuv8KpU1OUPorsQBpR+0YaVGs7CFdScGe+6yP5kTDL?=
 =?us-ascii?Q?tffFDx0tpdYh4+uUHooC5/59Fee1igmVmFpA4vvP2y0NHVQPh/LlcTWhfnmP?=
 =?us-ascii?Q?8rTi0U3LSvjvMKCDWSA7OtNsFbOTZZXXbVQJPSs5jGj8jjmH5V90wPwB4ZMQ?=
 =?us-ascii?Q?TiwfOH7Y45kpkKbfyDXDQU5vMNOln1vKukq3qWsy635OsEABT4vI2JQoNwkc?=
 =?us-ascii?Q?2V+jdL3s83Gax2iyYIXLZkhzj7vlt73WUWQQ1tdP7CzSPcuHrOdyMasO6TCa?=
 =?us-ascii?Q?pVA6eZUhE/e771EaMWgTilIRHv0h40BtW3zTMK0e0yQzNXuBIcTPf1X/d/7m?=
 =?us-ascii?Q?DqHVbh1FHQDQFC8GCDu3FCKJj/Sz1nfRUdlOJonvtWlJSXzjrpI8iW8YiXey?=
 =?us-ascii?Q?KftjRmRA/5fk2ZKG0NKH8uYmY2Xv/8MGRzXx69OuPLOFAn9P2DwyE3/Po9GV?=
 =?us-ascii?Q?ildyhCcK5CD4JnuwvKXR/ZxKkImWFx2UwMc+Mo0qs6scxZhLkN2QqPlY2lGc?=
 =?us-ascii?Q?y5hSdYol/LclfNcPB86rRDXx+ZMpQ5ip7UkDZY3h5xyEiYjxTpARcclAqsgw?=
 =?us-ascii?Q?lFLjAKN6UcfHPt4gXgCnsL2Q6mSkekveqqZLu4RoFM2jiRlebG/hxKOK8LSV?=
 =?us-ascii?Q?Lk784fl9HEAFxRZZvxFd5e5GmB5FA0d3Pb4hmhPCLkKW3JqQSu2ECwUYc1TJ?=
 =?us-ascii?Q?CaiW/fvtUJkIPt0MJhrI7BrGEugAA18DWmdqebc6NGZ9LDn2LrBHTmLKvHHa?=
 =?us-ascii?Q?NQcBN8Qy1ecEBSukN6JgLfvGmF7XEsRTcbtk44DHZaVEhy4i6wUvUmgmScYI?=
 =?us-ascii?Q?DprtRy7Adr4hdRValDgE2D/lRs+OYrHM9NiOKJwY0tf8cyQKBxT6fcUjrtdb?=
 =?us-ascii?Q?mrRkO9HRIEY2ArD9TBHa9A7dk1FAxhzxpNXKoLXu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b76caf3-a68c-421c-f2b0-08dd705764e7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 13:24:41.7641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94f+W79Kh41c/37B6vsVBXYt6Nme4crzMU9q6wSugOQ06xq/6I1npX2vJjM/PhhQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961

On Fri, Mar 28, 2025 at 05:26:42PM -0700, Dave Jiang wrote:
> > For now the following builds for me, but it is a quite a mess to undo
> > the assumption that that the hardware object definitions can not use
> > uuid_t:
> 
> +Jason.

Seems invasive?

Maybe just like below?

Dave please send a patch for whatever is good..

diff --git a/include/uapi/cxl/features.h b/include/uapi/cxl/features.h
index d6db8984889fa6..e31862dfc2eda0 100644
--- a/include/uapi/cxl/features.h
+++ b/include/uapi/cxl/features.h
@@ -8,10 +8,16 @@
 #define _UAPI_CXL_FEATURES_H_
 
 #include <linux/types.h>
-#ifndef __KERNEL__
-#include <uuid/uuid.h>
-#else
+
+typedef struct {
+	__u8 b[16];
+} __kernel_uuid_t;
+
+#ifdef __KERNEL__
 #include <linux/uuid.h>
+static_assert(sizeof(__kernel_uuid_t) == sizeof(uuid_t) &&
+	      __alignof__(__kernel_uuid_t) == __alignof__(uuid_t));
+#define __kernel_uuid_t uuid_t
 #endif
 
 /*
@@ -60,7 +66,7 @@ struct cxl_mbox_get_sup_feats_in {
  * Get Supported Features Supported Feature Entry
  */
 struct cxl_feat_entry {
-	uuid_t uuid;
+	__kernel_uuid_t uuid;
 	__le16 id;
 	__le16 get_feat_size;
 	__le16 set_feat_size;
@@ -110,7 +116,7 @@ struct cxl_mbox_get_sup_feats_out {
  * CXL spec r3.2 section 8.2.9.6.2 Table 8-99
  */
 struct cxl_mbox_get_feat_in {
-	uuid_t uuid;
+	__kernel_uuid_t uuid;
 	__le16 offset;
 	__le16 count;
 	__u8 selection;
@@ -143,7 +149,7 @@ enum cxl_get_feat_selection {
  */
 struct cxl_mbox_set_feat_in {
 	__struct_group(cxl_mbox_set_feat_hdr, hdr, /* no attrs */,
-		uuid_t uuid;
+		__kernel_uuid_t uuid;
 		__le32 flags;
 		__le16 offset;
 		__u8 version;


