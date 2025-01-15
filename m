Return-Path: <linux-next+bounces-5206-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F317CA1162B
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 01:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CEAD3A449A
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 00:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C8613AF2;
	Wed, 15 Jan 2025 00:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UpOgMwlg"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A62429A0;
	Wed, 15 Jan 2025 00:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736901697; cv=fail; b=YmpPVNOHA0MbR/LpJELoz41VihX0aPA4bgzcqbecV86Wpc0276lgDD+dLcQzuc0+ASnRDveoi/JG3WUUVeL+5Ydq7bK8CdeeL6HgqPq77reTwpVcN2xg74mGSGZ8E0KZzj+pkdQYa8eU8HSD6HgodsuFdqZJO0LW+JHPooZO7eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736901697; c=relaxed/simple;
	bh=/Y+QqQ3/pxIcZVuvQ4TZLrHPL/qMGJF9/Rax4rTvuZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=laNk+uhBenMuPT+9Vvm7HxoEOVBBMDkRBsmLt7LBVCFsCvmevO9K59K/QDNYi6wQGkMhoFRN7LBwdd3pJjVAmWlCIOBTU9wX1gFOxNXteJ/6yOLD/vQQNHKJSjHpc8iqqF/Hi8u/q+FK149Fgnjy2LsFgAHQgSUXGaIQ484bcqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UpOgMwlg; arc=fail smtp.client-ip=40.107.102.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtuc00oc4yr35iqzRFg3zWdUIqIQw9SX/KXRKAT6fQlZ7tr23YehQmGwGyZIoxR51PsmvjRLiMA/pWLAIhmVBnQK2V88exE7b6mb3xRb1+dib0wDzpf5L70mAycMLhhwHye2Z4KLGCA0jD0oRjrKoeFgpX5D5ecKe+6HgKu1eksjZvsBmSv5p+YSO64uNNGwNHdyjQgIgTUTFnNq3hpc8ieqd697Hh7BhGxd1yegNLHpje5y8nebPl2RnXWc9fF3VaxC2oKXHAjWUgtTDoGvi8hEWA0uoRZiRH6YPU7Dnoh6cSfn0LbmdORzl1bymsB/JeR869fw7ZYOa6EhH9tvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DwXjurk0jY/9KhiSKvWchG7q5jiBN7T8RilV9Omloo=;
 b=BZ7nRrOaKye+7Vg7iH6B1MjQEvboxYW7JeG9Vcor3Dt758PK+Amc+z67SfCqNqW0g0TIyj9xM9tv4XnjrRD6uG23F5oGZqnaDXLfWXhIojmvyOPyhoOtsWSa5ISkNK+k6J2mt0zdb7XfcZOxecjGPFvDDYnmcxK4SByQETPq/sMMZDXJPWLTcax3WBQL/+5NOqHp+W1hBkZsQoIw3HjnPZP7T6Bmw4EfoKM849YJPmO0sfa0ZYcYN9ZTqtSd5Mea3fg00rmHyv5DZwz0E2H6FWr8Te+Dx1/6IKCgoEmC96YTA6pcPRg1spnh70jvllqXCuEbth3MV3iuq8dhskCSiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DwXjurk0jY/9KhiSKvWchG7q5jiBN7T8RilV9Omloo=;
 b=UpOgMwlgWp81YnrU8dfZWn1aFwCkxewUEaujfCc5ppxMjSAceFJWI5dek+A+cFYetzHG6ZAd4v+vM+khLLpQCA4U4yhm6iJ/7abc1maZ/j66kt09Z6Oa5w9umqP9en9U796VR4/YoY0afxPHp/YMnwW6WBmUaQmdDet2Y+ZqjqAdFc3oa6yj+ZztcQ4H4wY/ipt5hlwrNfLG+JzqRvmhorlwHaEt1899nU6uWuBHOyTiICuJQMdZOLJ3uxApoEcF9z4do0gh69YX8amj8aEwab+ZXMK+a/7541yXf1cBBnjcMrblj6dI4Dy1i10HWuZcaIABoTFmCti17gODsUsz1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN2PR12MB4358.namprd12.prod.outlook.com (2603:10b6:208:24f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 00:41:31 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 00:41:31 +0000
Date: Tue, 14 Jan 2025 20:41:30 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>,
	Bernard Metzler <bmt@zurich.ibm.com>,
	Junxian Huang <huangjunxian6@hisilicon.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yuyu Li <liyuyu6@huawei.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250115004130.GJ5556@nvidia.com>
References: <20250106111307.7d0f55ba@canb.auug.org.au>
 <20250114204828.GI5556@nvidia.com>
 <20250115082721.732ba8d2@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115082721.732ba8d2@canb.auug.org.au>
X-ClientProxiedBy: BL1PR13CA0352.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN2PR12MB4358:EE_
X-MS-Office365-Filtering-Correlation-Id: 772b5957-ee37-4af8-69f9-08dd34fd5b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vjDGxOujG8tZ7hPIT3Xwy3C9eAxCjLGiOhhQ96d8sIgudQZ9ncdl6x2A+bFG?=
 =?us-ascii?Q?tXyfVBfapUdKZHtVq7UnS5qmDPszj896nd39s/+FUOHr1e3hVuyw3x4FAIVL?=
 =?us-ascii?Q?8bRVSBsNUFSTyr4lid7TJ1MZj9xBOLn5gy4lAxktMGahZ9R6qEs0C0O0Ndhn?=
 =?us-ascii?Q?WkXXRYeamdUDe2oSKfVGDRSVEIlhri8pgXd2BiUJqg/H1IjUB2J2t4nnFoWo?=
 =?us-ascii?Q?d5M8wQa4uR+eEKDZMJyEHn5WDgnG93YBwl3/qW186COQj0b1lkFrF3KD/Mj2?=
 =?us-ascii?Q?QO8tPgv8V9KevGMOq22r7y11p8KI4rYJgD81LekUjBxlPIzEd0vmAuNxAPgu?=
 =?us-ascii?Q?pYe0xU2/1X9r5kqN+ev2iC4QQj0X2zYw8VxtrNiQle3w7xUQqOK99+MDz8HT?=
 =?us-ascii?Q?QcgomhWvQFXRzWNCRxjfCY1UYctc+QCaFjh3ev9/USGD2RxFq6mm3JWCoiVK?=
 =?us-ascii?Q?ikYli6d3DByNMWMYxF3+apKeiIfeXdcP/74eZ9u8YnH2tOH1dXy9wpGdWSCA?=
 =?us-ascii?Q?/ctdGP2FioDrTIhDqn312Ff7eZW/HOEhO1cydc8Eroaim4Jn60lNZGnjRLTy?=
 =?us-ascii?Q?hyQFVan3enLHoOKhZS2GGUb8EdgbEV84taqTe0Ae/JDtoxqM80dgrupHZCPq?=
 =?us-ascii?Q?PhQj3EsmoJ1kOROnULGeic42TG/MR6bGxUT2EItK8rmFjVfd51TCAlTO0Qcn?=
 =?us-ascii?Q?l62HRN5U7duzcdubKrbzSsEji5Eil8qZDWzpohCpBI1ACEBXwvQyMGvKibGZ?=
 =?us-ascii?Q?SDExn6v5fTvtT4y4Pjcbjq2nf/sWwTR/gZLse1kd55VK8DIoSkFpQjEY4dWR?=
 =?us-ascii?Q?R9O8kmbJ6ZUFg0ubJa900TxHLpOLJHloikeIeiLprN6LDCPQqtPlcbJo1mao?=
 =?us-ascii?Q?yqXajteoX5rcuxO5oFvOExhSAIOIYGm4fnitJifGu24OOfQQFvdqFAZciaea?=
 =?us-ascii?Q?TKhdpUR8se+LwQUpm/4fwJA2H47F5go5LNMQeCIyqEgBNogN2DaulzOfiqen?=
 =?us-ascii?Q?3G0QJmoQBt+0o4iArEWWlohaGib+e7EV+CrAKtrhE2znPowVREk56BNzSr3h?=
 =?us-ascii?Q?oDuIlpJyZuIumb8U+i35SWb9E+Tga+n9nh8ffFa5gwsJkVx14TY0Kf9kgvci?=
 =?us-ascii?Q?YCEny71kVJP1MadHws/2TyCX3s4ZJZxLEp3muZWpDs939MYEFAgmlU34asVL?=
 =?us-ascii?Q?tLg1M2EtgYkwHhBMcm6WV4oB5PBiTYHC7Bjlh9LJ59wuS4wgk5lOnZAXj6ES?=
 =?us-ascii?Q?jWW0CJ7HlVl2mHVmn4fqCHYhTXrXocFBsk4Zw5GAsKZpQH0xS36dYdNysPTX?=
 =?us-ascii?Q?gbU0rAw5LfULhIPeqmF04ldXv/VrrN6Up8ZEx9LOgLIwV3rCC4y2uYcK0Haw?=
 =?us-ascii?Q?KF/KfZykLQi7gBGjDkWD7ZXTVWs4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U6nKWfm8XyWPJc5Bm0smBPClYiP9vI4SR3b8L3lh+S0qPHjY4Xv9BcH82rCO?=
 =?us-ascii?Q?koSHgKZx7HPROujaOHeuZYUZKru4V1wS85qEd0mJHNGcRpkTdVYacufzdR6V?=
 =?us-ascii?Q?bwRna9iH+UuytEfGbPx46gCDyAIv1vkv3jOkt9scQXjOhKtlGbUz+O/Spqqn?=
 =?us-ascii?Q?IDNEibjdTNpTFCe3kkRN5Vab5P8P/UtAnXICe1hI0eNfbAl06Y3d01m51lL4?=
 =?us-ascii?Q?cI1UM+YDpwhVWKskXAH9XoBZuLiBRbaB9zhsihNLbCCdPXAGht0jqNhgWaqU?=
 =?us-ascii?Q?Tr+zLfl0ghWfC5cpVBKQoITjBxIvum+xiTEnHUQBVvLlZYPVFZ0I1tIjhOdc?=
 =?us-ascii?Q?PpOZilJtB5ucODb9vdqt3LhXxpaEbobgeeaWYqPi9IdP7Mlqicp6IFh+lSeL?=
 =?us-ascii?Q?Iy0olHF7nymnusW3O2zf0dY4VX7Lu8NIGIsmBPkv5DH93j/P/SLJpCv58aqv?=
 =?us-ascii?Q?J8YXSTcZQY0+ofciOuSVSCD39GxFzFBp6Tkk6ya4zPGeGu1toZWBEwrsrw2u?=
 =?us-ascii?Q?lla8ikynX9HALuLVmH3jCKr8W+e+adOg9FMp7z1O0+k94Ko3QUkiTLzrBuSM?=
 =?us-ascii?Q?Q2ZU1YFOvZPqzbMjKE65KxyVVm/+xgYuUYb50PKMbJ0NI+jaKqI/pNxXqzgr?=
 =?us-ascii?Q?ubGiUMccFLjjlxdIUfadM04Slh16zJyAmDUUu/YUccMUgKrEv6csOtTlv/Fm?=
 =?us-ascii?Q?qiuA6h0hM3Artwk8UDr5XVEs/biRZDL4dXPkVuK9gEjFdTjEX1eiMB1/74P9?=
 =?us-ascii?Q?/SJQR6CrFLXMwRWnQFHkdQwhHWSfciy1FI7etO1udKryv7sGGmfPrRBRvxhw?=
 =?us-ascii?Q?DGx/o4Br4JzGJnONjdIsICx5dym+HeErEeJwmQ/ysA3rqXQAma29P7vzswQm?=
 =?us-ascii?Q?N5CmeBGMPd6lwwIkY8GylEDgqXSBVmHWFM/r2jgKM2kmbcA9IatPxTSMRzY/?=
 =?us-ascii?Q?GkbeXT+CNAg3Veiaay8VtjODkvD1uE1WJoPKWUOrIoFNDsbihHaUxbRLNEM6?=
 =?us-ascii?Q?xKAUtSW2THRHz8glhBQ2Cz6Un+WcUduOoixo2ji17HM4IS4kX4am0dMtyVt2?=
 =?us-ascii?Q?EMHEg1BQuj1GifNFF924LGOykpB/2JW2tmrKbzTpfVj97tdGh6pCc7GnSTqm?=
 =?us-ascii?Q?aFAckCrXKKL1pD0zVJMt4Ws6k4hfJ1uB+oNOHPquj36xhp0F7ev8fA+ATpnn?=
 =?us-ascii?Q?x8Z2myw1n/9Z6hCD1rWBkjRR6c0+z7wFzPTuF9X3OQfdJ9HPatJ4SZOGjNxP?=
 =?us-ascii?Q?LbbGd4VcYL+Tw1OQeSBFdBvNMlT1D0IvXijBHc7XqvStMUQDmCozRWqNoot1?=
 =?us-ascii?Q?/mUvhRHXCD0jc192kp1Yr4bq0JJ7puCbVOT8kA/baqXN46p5vc5ww2v6ANW8?=
 =?us-ascii?Q?t6rJSvdOqJu6ahWaPPiXRuw/Uzyjlu6QMOwl2YScpyiIyNuYaisclJPXd+i5?=
 =?us-ascii?Q?O2bjFrhHYvofUMeipmf30uQ2xlyG7ymSpwcT5A0vm2fGaO9JaYAXC+4UCYNO?=
 =?us-ascii?Q?UmpsDLrvWvR1cgO2YYI4WvngC5HECncVeEGz+I/cDoKHzd5lXbr20ESENiwd?=
 =?us-ascii?Q?qt/rRSg7iHjO/ZZQ6Ag=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772b5957-ee37-4af8-69f9-08dd34fd5b18
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 00:41:31.7585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FbWSMn+ASelkAZc3SWTqDHRhKoqWVwUZLBPfDqhzjA9vECatAi6m3puo4aTnJMk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4358

On Wed, Jan 15, 2025 at 08:27:21AM +1100, Stephen Rothwell wrote:
> Hi Jason,
> 
> On Tue, 14 Jan 2025 16:48:28 -0400 Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > I think we need to retain the ib_get_curr_port_state() call:
> 
> Why? 

That is how the new system is supposed to work.. Drivers are supposed
to call ib_get_curr_port_state() not open code it. This matches what
is in the for-next tree:

        attr->state = ib_get_curr_port_state(sdev->netdev);
        attr->phys_state = attr->state == IB_PORT_ACTIVE ?
                IB_PORT_PHYS_STATE_LINK_UP : IB_PORT_PHYS_STATE_DISABLED;

> It is no longer used to determine the attr->phys-state value and
> then attr->state is set again just below.  

Ah, missed that, it should be deleted also, and the phys_state should
use the other hunk too:

--- drivers/infiniband/sw/siw/siw_verbs.c       2025-01-14 16:37:02.023738738 -0400
+++ /home/jgg/oss/testing-k.o/drivers/infiniband/sw/siw/siw_verbs.c     2025-01-14 20:38:42.611302948 -0400
@@ -189,10 +189,9 @@
        attr->max_msg_sz = -1;
        attr->max_mtu = ib_mtu_int_to_enum(ndev->max_mtu);
        attr->active_mtu = ib_mtu_int_to_enum(READ_ONCE(ndev->mtu));
-       attr->phys_state = (netif_running(ndev) && netif_carrier_ok(ndev)) ?
+       attr->state = ib_get_curr_port_state(ndev);
+       attr->phys_state = attr->state == IB_PORT_ACTIVE ?
                IB_PORT_PHYS_STATE_LINK_UP : IB_PORT_PHYS_STATE_DISABLED;
-       attr->state = attr->phys_state == IB_PORT_PHYS_STATE_LINK_UP ?
-               IB_PORT_ACTIVE : IB_PORT_DOWN;
        attr->port_cap_flags = IB_PORT_CM_SUP | IB_PORT_DEVICE_MGMT_SUP;
        /*
         * All zero

Jason

