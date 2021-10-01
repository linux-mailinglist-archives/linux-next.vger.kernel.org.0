Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F20741EEED
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 15:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhJANyB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 09:54:01 -0400
Received: from mail-dm6nam11on2088.outbound.protection.outlook.com ([40.107.223.88]:58209
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231513AbhJANyA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 1 Oct 2021 09:54:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ht//vnNgvYg/LyyP6vtNDQR0WaaZ/X2ynsf8doMx6kAaUGeuNazrznFaBYTa+FJL+mNSgbsEW29yQVH1IqDuLTOeDzXdbM/1NCFhuExqvkWowl/ZbC1Xz2dDTsFY/+EFdPzOqK1ewSmnx6aIehM5dqQ/cvBsMiq3WxCe+N9w0u3phe+5+l0h5l4z0fl7kuRPcz1vH8yS0KXPkWHOqejTWijTRgwn8STkM8ETTd15u6xTObVTlCFZoX9EzQLT8lXweB/l4c+93623U8QB3lCqyvKNHkQfzgKHh0qVcVsW25e9+wrgwJkRjcrloN608E+y0xFxEOac1SVHFAQVl6Ci2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrPIlZb8ZlwSwo6syBvT9tNRyT1k/hlOEfZUsJgCSCU=;
 b=Qh0d2kUPHLHTebWEcj4NJhpMjy15qQ2G8TlQiuAV6vqfX0EeYG3wCNErQ/Oaxsnnm+q6KnGDWEN2gxePdtGHQPBLx1X0iiK+fDY8GEhva92pE3hd4r35CDikKWwrKztLxAdGj3MZJtbfGVuhNQMuSYBGd8rzI1LbnUOnTw+6En2x5dlRu9NnUYNKacZeTyLhSReaV+50u2FHrnzxWqANhEpigCRwZEX9nscP2vsAKC0ZGhIcbBG1k+AZAqdU19TY1K+VAZ85BrlMddtXnwZfuLFwS3M1uoy9PsIRQ/+TLr1Xu8pZ2eq7DkUkV4a6ngdcq2RI6oQ4WEcAkUXP1Q4+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrPIlZb8ZlwSwo6syBvT9tNRyT1k/hlOEfZUsJgCSCU=;
 b=Q5CK7uoeT5SC6DZP8/8YUZt/LkCl/Yh8sO3gGAGSxbjMpZQLCAyLNE6iG4iZqhN8topyatO43QV5hCcMTx7F++g5Th+UdSEhKWXc/4GC/ZsdFzTQiwtLLfXw5QAI53unhV4yl/P0tJuy4dhk3o/s0VqrMvrjLD+4EYNgT4M94BQxrqz2Pe54uQ11b7ZsavJB07TUFpe4IejLxO6c1QT3E/mvQgXcJ9b1L7p56F6WSQWFRY4ZROO3WCyq2vqp3wjdJ7er/o4lFFra1AXS0n0Qin2G1TUNJGcgFZin/c6EEGIkHbq8Y+tMYwCZyeeyrslyDTFFhcHDoG7bAQ5FE+7UQA==
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5208.namprd12.prod.outlook.com (2603:10b6:208:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 13:52:14 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 13:52:13 +0000
Date:   Fri, 1 Oct 2021 10:52:12 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Doug Ledford <dledford@redhat.com>,
        Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
        Guo Zhi <qtxuning1999@sjtu.edu.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
Message-ID: <20211001135212.GR964074@nvidia.com>
References: <20210930113518.4b9f55e6@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930113518.4b9f55e6@canb.auug.org.au>
X-ClientProxiedBy: MN2PR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:208:23d::29) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by MN2PR06CA0024.namprd06.prod.outlook.com (2603:10b6:208:23d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend Transport; Fri, 1 Oct 2021 13:52:13 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1mWIxQ-008R6T-I7; Fri, 01 Oct 2021 10:52:12 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7059cc3-89fa-41ef-e27c-08d984e2ac2d
X-MS-TrafficTypeDiagnostic: BL1PR12MB5208:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5208F32E0CFAB87CE4F494F6C2AB9@BL1PR12MB5208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EoxUCY9mNvHIjlZOATCvE7I+HBtjmmO1CRqCyyeiZ0tSJYlpFmPvOqdFw7NU1cOdebCNsnONVKqw6eBezaUj3X1DJhZVf9c3KD81r8Hk/v/XRjJ0vxMJ818JdVsRJSylxqPOouK059jEY6uQ9g+ahFLBAAOSIk/Id/HKK5a1hjzntDuSL74XnSSvpOzZb+IZRJKMUmUoRkRheewAZZmZtf4dPqHUG1q/cNP+BIEi4APmwSATfRSVtYICw5UIXTNN7Nc8i/aw1CWteIMXecAzFoCm/7KRmyULIdhGCgn/opd4lMZg/fiWMeHV0Xd3xKfrKN3b92Ro35ahPPeB6jaWY54DscNbjLrVlNs1ujucZE9gI8d3q0TyVuazk0OBXxBQAMAp7mVpOqO6QADFTGhz6EJ59hPHxrq8oBUu1TSvgpSdopIU3MsIz2PCsTxyW/nOlOSRGr8jbZ093r+c0NrLLSPDrUA8N4P2Wc695RIpye5jV3qfS38liF/kO4y8jVQSXyDkm90oR1EL6FvdYBOwLrK77o/jwsUtv/u/R+6oYwmYjLOvp8z/XVKptorbQFS1mZd8KpOEQ/qc2K7zRHhGcW/cVdCJmlmB43oDkhCHSANyM6G7Wtmq98Bt0CcFs0yo3aJI7YgT57ORep1kW3v+9RezHESHJFDP+W00XvJIGDo7c7jj2yXbDxEYOBuyr/HErzx7VVKmMKDGShcUd0dMhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB5506.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(54906003)(1076003)(4326008)(38100700002)(66946007)(508600001)(4744005)(26005)(9746002)(9786002)(186003)(426003)(86362001)(33656002)(36756003)(6916009)(2616005)(5660300002)(2906002)(8936002)(8676002)(316002)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g2wfI7TgQQlibPVoznCd8NUIrMBimvJUUg8pZoVQTA8bNhRouSfRaC7r4vSR?=
 =?us-ascii?Q?eZEqwGm1y6YRb0gXbfITbiH6c7qrqgergmIPwh9BUbYsG6TpMDDoi+b1E+D/?=
 =?us-ascii?Q?tdbFD95e14kAL3EK89xdhJLaKydNNdo4xDAtJmco3C8eXnzj8uSZsMJnxTVL?=
 =?us-ascii?Q?p+kEIO1LVItcqF2Ysm9bgtC7pVhm1RYqdccoR+fDg2W3Tva+bxDEBfHXn21l?=
 =?us-ascii?Q?ePZWduHUU6FqFU2onpmaBJBx6yRg9WMXSSrWGezZue3iPR69vYCarODN87Q8?=
 =?us-ascii?Q?VITVD1od4U9TXVLbt6SKVvV+dlAeybDVj3HveZMWkJ7zDZbZpjNJKpefnKhF?=
 =?us-ascii?Q?bRyxIilBuU7YRepVAvE04rwWCpnDTBnt4PYn+cH8qiaZVXQ5mTJ2vwylZlcG?=
 =?us-ascii?Q?OsK4gTjJxWqHc35eavifGND3+9O363WYBp/z5TmBFG77I7wqjW9joQSg2BCJ?=
 =?us-ascii?Q?WGNy9LD+oharFofOwvAKvuKSIrAXj/a8H++lrAt2D0TgsA9RksJvTM+j1vKY?=
 =?us-ascii?Q?3AMu3cGmSg2Osn9vsoEjAqJ/r9tQosTmZG4l34QlYU7lK0NjjfzjxKiBtE8n?=
 =?us-ascii?Q?JdWIvxKu95Tj/n3eIGpqbLZP43GosTfhQUv8bMKjjRA40JuH8tOZRMfouo4B?=
 =?us-ascii?Q?KrgZPqAaEm2KBUccY5AYhpXkFVRFxmsIdmhScIn27wzURMxfKyG7c+lXQ3dT?=
 =?us-ascii?Q?zcwOIzPS+1bz+e8s68s3dPHotY8qrsLuK6RR68MSyb7dqg7apTuK/TWx+EbK?=
 =?us-ascii?Q?J2SAJbe1UoyvsQKY97l8Jnuv84Iok4G0yHSXO+e3cID5W/gbpixMaUzghb5r?=
 =?us-ascii?Q?zYK1W2zgRgRjXIDVhQ/ZGy24rQKWwhIQr16vwRoOlCPjN1xtuWU2upSMcLFs?=
 =?us-ascii?Q?iz4yChV3Ty3wKJgznW+rQpqnaWjKitmGPJrJVCxldooAB65Lh42DPxCs9H2n?=
 =?us-ascii?Q?JZnzh03bV+6wWaxWyphwgO1en+neOKYKTS7xYUR7rVFSabFjBRd0I5NMycI0?=
 =?us-ascii?Q?O/qpwxHzjR8LHfgBzFCY1pXe60PIrYk7XtukuwtK04y5DVy14gfXv+2mL/cF?=
 =?us-ascii?Q?1r5KEw42FshGvMqDHZCIz6vkslV+IBvJL86X5OOTvpndxy4n9r3kUL98AbHL?=
 =?us-ascii?Q?ENCRdzxnMMYvuP4zGpCF00GkHdjL1iulnLKk02YQAYdjO/ALq3DCjsVCRpiR?=
 =?us-ascii?Q?KaaZFCeBnqdnt4/e5QFTe/LBQBQ90NC563964MA4OoTXXaVQ6i0GW+vZY5fC?=
 =?us-ascii?Q?yIYm0Jmc5p83SQp0bic9H8/OAdM/7xzvF2nbi7FG6TbMtWPIUR6n9y8kwDAz?=
 =?us-ascii?Q?3umNzvR7LwA0LO/iUSrxz27OgNxeEpbWnDQQo+rKgKJhYQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7059cc3-89fa-41ef-e27c-08d984e2ac2d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 13:52:13.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11+3INmB9tE6FS8kqcae6kuJqOQAr+AdAjYmww5cOgy5OfYMS1reLkaxwEyhgFlc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5208
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 30, 2021 at 11:35:18AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rdma tree got a conflict in:
> 
>   drivers/infiniband/hw/hfi1/ipoib_tx.c
> 
> between commit:
> 
>   7d5cfafe8b40 ("RDMA/hfi1: Fix kernel pointer leak")
> 
> from the rdma-fixes tree and commit:
> 
>   f5dc70a0e142 ("IB/hfi1: Tune netdev xmit cachelines")
> 
> from the rdma tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

It looks OK, thanks

Jason
