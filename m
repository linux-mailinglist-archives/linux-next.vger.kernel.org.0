Return-Path: <linux-next+bounces-6113-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B26A76C78
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 19:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B0C518887B7
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 17:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D56278F4F;
	Mon, 31 Mar 2025 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jKPHH+yz"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D093E3594F;
	Mon, 31 Mar 2025 17:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743441482; cv=fail; b=s/Kk3tBW0xW/bfMsiYYeyH/SxI/El0VyK5MyhFH1NAOJUiSkJK6JbyinNr6vMhES6phSJE4+pD0fLR+CCZPR0l6zcKWaeAUTWeuzx9wfjOoaZNv3X9D6x2hAqAath/f+P3SQhJBQbzSDq2ApnpTK5lgB3En9h1cdtZY/msMYB8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743441482; c=relaxed/simple;
	bh=vzx83ETGVRBPh29nvweOURBXQlMLM+NxRikxoFCNDg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n47JTeCiwf6OaKcOuF8zcLTmWgHjipP/n7Q9yhkb7h2UoNoLhkLAvNPvqlBK7YWwx6J29VeGHhOCbviNksHbAbrOybxL7ScDzB1HQrzw6t5F31rzK884ekSaLI3IYDB2Iiiv4ZtUbH8LoaQUhWg1G3Md2mYErOnyiXWH7pdNIpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jKPHH+yz; arc=fail smtp.client-ip=40.107.92.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1JJI7gZXqSPpmRU1qD0bxo5RJQHZNzC53Bg04YiFJTVZ5E8m4zi60f+nI+kUiQO84yd+OMQx39fc/Izkw7uekD3yJZN39My+XBpA7lPbp2jnKZoSl133X3gfCGaQGkUN6uZIJOMrZVMI8Q2FSM0U7+FZtfQ71wK8GUQo64wNh7jn54YKK+pKUfyXi82pK2SCwmm5TgY+zdRuOyjTMKBc07kg14TYKb422JC4QBw2R18Kn05aaHwdLE3WXkLhJilS2qV9n62gk8GUAdzY9Y0JZBkWYatrpboB1cqUBfTu6yflNiTpXAt9GmpMPiYPQu5CARvAOqSEY2LGYoJrJzuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh9JuiFxTiRd1KDATdyonxM6HN/3r4TT27oJ8sW2F/w=;
 b=KI0ExQwgs2L0zIUTWRqJyaLYo17FPGZ2x7iyPyiKAmQgqUWm4a/S7wN54XswckQ5mw/1+GbOrbWHUMjFPXhqGVSfAHG5/8IVNQELSHkV5SgIf436lTyxX5VbNzyGdVYPuEECVLv0VZwPNPDWXkMxzAvLodnEHo5sTDlKBaFWJSPflIperm0GAaC/RPhUNU7k3BAsAiIrAyzdrRxUrIGz2/8c+NeucHKaz11e4L2jl+8FpyP8jcInwjEpQd77/evogX14hRrog2GtcgCzScM3RQ0Voxr26WCUNQpDrdwEx/MKEmMWVkvtYP+3o/qmYgMWatCGx32ZfeiAc8TzAJjZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh9JuiFxTiRd1KDATdyonxM6HN/3r4TT27oJ8sW2F/w=;
 b=jKPHH+yzq1FWX0EqoxbMJUKpEhvj67phu4CTj8EyZQ68R6WSA9iXdqqOiIT/m+s8aGgbLFU34ZtRNm4QEuDdy1bEJiipVV+4ai9urfZEYyAkhb2FS8a3L3Sj5JLza2QKedqQ9JCsW7WDdMayIBzJAY/18Vpr979i9Xqhb6yt/pUcnvzLJ96QmhOxTDVNU5nLK/CgwqYd72vMvlf09sCrpP/YgfeSrmrI+YBpo7GJrhRJbVCjzNj+CWNfsAFpoq536s8LIBE6+17GL6kUWgXA6WKbPPHypmjQTxXcW/sOTIjTQxJDlhYEo9x7UDq2hCZo0IN69UGH0GHgpBFqJHC5mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ0PR12MB8165.namprd12.prod.outlook.com (2603:10b6:a03:4e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Mon, 31 Mar
 2025 17:17:56 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 17:17:56 +0000
Date: Mon, 31 Mar 2025 14:17:55 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, linux-cxl@vger.kernel.org,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, gourry@gourry.net,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <20250331171755.GC289482@nvidia.com>
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
 <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
 <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
 <20250331132439.GD10839@nvidia.com>
 <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
X-ClientProxiedBy: BN0PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:408:141::20) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ0PR12MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fca134-d2b5-4513-cb16-08dd7077fa96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mEG+EJefVSJCmj7NlH99HfNICLpZeVqCQpUoWAvZoev2sMaHqEkLZx4y0hzH?=
 =?us-ascii?Q?Nk77QPrU43fwMuXUCz6ZuClZAInuJF03P94Lq7iVwdwpaTD107pPUzLPslez?=
 =?us-ascii?Q?2TQKUJ36m1d+faWLkdCLw3s1HvSfCdhI1XijEcNr8/tmact/WJDZ0xfvhJev?=
 =?us-ascii?Q?oAk8ekmelrllszeH8sdO26gZvPgix7gmp1jHSPTviSd+GarO/I8/pNMy394p?=
 =?us-ascii?Q?cIvgvYdMymiKS0jko7F2KHg4nKFAogYvH2jH5bCQOmrcMnAu+pDIz+DxhCrp?=
 =?us-ascii?Q?sqTkgQb61pIbUKTjE6g6q6m4ceMjdTPyfCrIh4GwVfZ/D/X1e0zgRMdYiTuF?=
 =?us-ascii?Q?IeOSCcXH/7eumyYbZkErJh+l9tShHFFc/gI1Dt2jy0rF5L20jJBbM/yr18ve?=
 =?us-ascii?Q?aWqDkFOKFomW5sINniNQLYXMmdkbeqBNlVw69+CxqJkILXiX/RB6oCcn1aiQ?=
 =?us-ascii?Q?lzKgecbAUk08mtk4yrNW7cnzrS4AKJ7r/NY8ok1RGl4ohf7w6akhOJP4RNvV?=
 =?us-ascii?Q?7uy8Q2HS66zROrl/aGNxsU98iUyeJBkMBEyXsFm8EAJAMkB8XYdwCNKzKc/L?=
 =?us-ascii?Q?gAKh6tHSOA9rAEn0mbULKXPwXuyVjQW+eQ24xct0PLiLKkE4uAaHrnnYuzhy?=
 =?us-ascii?Q?VNuOcWV/yGxK0IhsI/POLOrikio5qJyhFjBlIaMpY1f6e9Ivpc8OkUiPCoeR?=
 =?us-ascii?Q?eh8Tu9Y3VBq8uYmMxAaXS6JPcQvRoGp9fLDFx6yTmeyA049dJc+TTt1dzFyJ?=
 =?us-ascii?Q?fWcWGYLzGOUb9bpTmHK8MDRG95uGyCQF2nIcvWeHU9S+SmIIzkEsjqHB6P1t?=
 =?us-ascii?Q?+u9I5/soUx6P1L5AsVyhVhiVqrmXcYad1Ust50sCjZgwF144gs944Ve1nNXb?=
 =?us-ascii?Q?JBo1PCUvWj1wWvrui5i9UCLvVbfwOYZvyh+2VoLeh4up++3sP6+CIyqzCXdV?=
 =?us-ascii?Q?R11GbwsDX5QHzWvan6XttzsPWrqWbict+zJa/7znZga9ntizGIgA8Nt8Spo4?=
 =?us-ascii?Q?WUX9ExbDRtC0bm7RSuWHsKphgut4Ehwr2pKK+l5g03ieZpLvrq6dvGiPWSLR?=
 =?us-ascii?Q?kySN4LS2Y2BGtWFLCamh/KyEGw8aa8Jrlgo+GLRugbRG/yD9jW7zgF3T14Mz?=
 =?us-ascii?Q?2X7P/d43AMB5hNU5acpwdqcDmZuZs40CAlKIzrNYZYFH/dV7AFVlirGjS0vV?=
 =?us-ascii?Q?zSrv0HGYrKmuh3vNKhU7j8KOYJg8y/p81abJ+YYQyqXbhvDzC0z6LAh3noSS?=
 =?us-ascii?Q?aa5dYY7VWgl2pXd3CBIGZ0LQmdW2jHbWbhmPEK43ajJoZL2B8onoFVFTaG1/?=
 =?us-ascii?Q?DkRbHl7DVjhtcUeo2n2Oszy9pm+6AhI4Ildw66NdR/X+buKLFw/DVVAHesl3?=
 =?us-ascii?Q?wCkyZ1bRy86qq7I8PoOKLKF/GUAZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2byisRdmidA9bk9I7BTZogHHRJHUl54IK9ZEXQG3IPlLeulkpsmIxPZe62YJ?=
 =?us-ascii?Q?OnVaYIpUyIA9OwhG0R4MfD3i33sHnr6tJQrIg+kZDNHstixEWcwZCxzsVWV+?=
 =?us-ascii?Q?8P9M+ynuXawxVhoJXBACJLca0dopF3mvprR7vyKS9EqFdPsn2YmMi5oaUYQH?=
 =?us-ascii?Q?EonCvhHg5wB8J18/2qhopkohm0PiKQeLU/55WyIl6vnW/ys3qvY2zEqykkra?=
 =?us-ascii?Q?2RVMCWHY0tOrDuLjgAqFg3m/iwWFXgSUhANO8vf5jGK3hIcW3nPnGtr2UFKg?=
 =?us-ascii?Q?62uvBmWJHxUGtxHe/kb4ZuuW97HFdlKwO6OmrLiDJvsNkoJ4BJsw4tOdmB6x?=
 =?us-ascii?Q?vDpL9GE+OOctaHT/g3XNRLo86/P982naW81Gz5G8Ri4KPT2mTATyF4PPUari?=
 =?us-ascii?Q?kZ9Sak+220oUPX9FMWx5lraA1ScH7lU/ddOmuxmsA7deWkV9ZBRoAEnwHVBR?=
 =?us-ascii?Q?A5R6fsmqxGYs5uw0rLgbhyX03gNepNFAItfeYp0e9A/m4j0nXOTjeoAfpHoY?=
 =?us-ascii?Q?ffpI1fIC5GoQpwpc5vaaD+5ekJEmj6XyyC4BYtvNlqwo3a7oDHLvIP3iXRXD?=
 =?us-ascii?Q?TCcEkhYJ6M+KE9ULgIOHAftM8LRVq5+JIo7lpjA8yEW+ZZc3U6BiWOcACOtg?=
 =?us-ascii?Q?JhkScGz7cnmkzqTgfhmdvbBjsZVIWBGNrR8MCuIyOtCEqO7gdXCvE32tR84T?=
 =?us-ascii?Q?NmUkEeR+kG1Gl69biU5HSv7JcODh5pTCcAYeuLujY6tS/vjfaLgXndZ5qZdR?=
 =?us-ascii?Q?xc8hEZ5R7tueHbg8PaFubg91qTmr3iTaZ/oBabiycta5WkrX0i85N7fVL+9F?=
 =?us-ascii?Q?/9dDs1aVKdNJZxLkhVTcjEaoXytVMB+tdHpsHVMvXEsUfGkW1CqLP9AzzLWL?=
 =?us-ascii?Q?Rz6tFJLoL8yRxYKe/Cd2UJ3y2FCV5Qhz7UUSTEAcPv9FSLKCraDL/YV/55t6?=
 =?us-ascii?Q?HiYThN/XLLyrrQCC76EMHdeo/vks3Dc+lohcXj7FWJr+zxsvcMmhHTSC9o4w?=
 =?us-ascii?Q?U4CS3DWSL9K677aNll1vNLQkSaPtYG6AbUlVNiP4Q3qbUHySSjc7dfNEXyZu?=
 =?us-ascii?Q?1iBS4qFocM1qA76nncK++9mfv27deN2VbGJyZWkTq/SGsVctwdLrIlYzLIrM?=
 =?us-ascii?Q?axmBZWtr6FyQqQOZg368nlyMUKMWX8mqo+6ValIM9YTEB3DZlGvx5Jo98UMm?=
 =?us-ascii?Q?qCmslDW5szMu4hbptPRDLSAAM4X4W9VEFl4pg5vWEGjisCNDj+AkJQTEDW7S?=
 =?us-ascii?Q?7dNZlTUAJ2dioJ24y8JTJUCHOEj7qtiCP8qm9D1/fbL5j9lVSbtpVM+Vklm+?=
 =?us-ascii?Q?vSmnmuqomCosenWEKOwPflPpi7aoik8oiWdqSaL/f0UwpBLTHb0p2JkL8lCd?=
 =?us-ascii?Q?EdEjydg6gtx2D5X7bqAIFxXdvB6lZ8weZ5y7pg5Brp8IWulBz2G/Y7mQMHCy?=
 =?us-ascii?Q?nSj6Dfo8JStwC3u72BFks7JMVr6L0M13hdMqxMHBf2MGAsG5rlKThjT3Q5tq?=
 =?us-ascii?Q?27feYX08R343kpsoRHvViOyLA67TR1RHw1YCoZqW4Dv6CUc/5BeBJ+4VTsoT?=
 =?us-ascii?Q?WqAFbhWfYHfHbE0g4RpolzjRbvr+SJ/neEn7Dspy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fca134-d2b5-4513-cb16-08dd7077fa96
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 17:17:56.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBKoMQLJm+hJ0iCV28AdQh8Jzg4/4B82cd6qbuMIqjBXoyfYU7LHUJwiFcX5POtH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8165

On Mon, Mar 31, 2025 at 09:54:55AM -0700, Dan Williams wrote:
> Jason Gunthorpe wrote:
> > On Fri, Mar 28, 2025 at 05:26:42PM -0700, Dave Jiang wrote:
> > > > For now the following builds for me, but it is a quite a mess to undo
> > > > the assumption that that the hardware object definitions can not use
> > > > uuid_t:
> > > 
> > > +Jason.
> > 
> > Seems invasive?
> 
> Yeah, it left a bad taste for me as well.
> 
> > Maybe just like below?
> 
> I like that this avoids converting to the kernel's uuid API, however,
> not quite happy that it forces userspace to contend with the
> type-conflict with uuid/uuid.h.

Oh I see
 
> So how about one more riff on your idea?

Sure, works for me, please post it..

Jason

