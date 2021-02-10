Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488F3316851
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 14:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbhBJNvM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 08:51:12 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6666 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231440AbhBJNuw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 08:50:52 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6023e4930001>; Wed, 10 Feb 2021 05:50:11 -0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Feb
 2021 13:50:10 +0000
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Feb
 2021 13:47:46 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 10 Feb 2021 13:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfRRdTEtsNmcXTjHCuNBqH4B4vXRiGyITERvTF7uCS/khwvNTHWfnMEGZJnFqCRYtiUpwBuGygAvHFXitoXXjXNfYhtTZF85XOkLCyEYezG+IeqeU8aMSs7odP0UQBWMTnhGoE94Hg0es7tWHtOu5Nb7MjGpIYDXobcGVnvvANMnYVBS2uO8p2CO+IGKrRG8nhfPG6e+oEbMt6oLaLQfYbsPvPVnPEuD47MvkNXgGKk+3fuDqimJnbDnkKyhXaeO3KkEcK9Gbu9v7EWyo5nTwi83z+0i82ULgkt1Q/hq4+h+6Eqd66lMNwIj2tVqE9YsUCRr09YGr04VyeWq+IJyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE9wrQLs05M1Mn/6HILf2376t69HuWUqZmT/HXrY1+4=;
 b=dtFuLTcN2+nJUZXKxQjbTwepA1jxsYvq+WcgJzMqbS5mD19ijygKgqr+4Cr9LIJVLbqETQtgNvzbiMXsG3jQpL00yHE5g+y+EAw4HTsNNJ81o4vD8rAUJ11EAn/AUb6Lcff1iJCdXlgzGmsS4dGL/IXddbqIlcK5OeQ8uurXwsjPXVUWijPBtgxGwOqC1P7UTEy6pbYgGvCBNSqaggrMfokqDCGHQc6by1H/GoG7l+AAMyoqLYnEFJ8Ti9FGaY8YWq7DcxSle79zMKHNOhOlYTN0RDzT3L9GUszGKaCPiYagj5EYfHaKb1v2Js7g/Ir3EAVMru0wNtACyY6oJ2NxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3513.namprd12.prod.outlook.com (2603:10b6:5:18a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Wed, 10 Feb
 2021 13:47:43 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::d6b:736:fa28:5e4]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::d6b:736:fa28:5e4%7]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 13:47:43 +0000
Date:   Wed, 10 Feb 2021 09:47:42 -0400
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Lee Jones <lee.jones@linaro.org>
CC:     Doug Ledford <dledford@redhat.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Parav Pandit <parav@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rdma tree
Message-ID: <20210210134742.GY4247@nvidia.com>
References: <20210210211149.3498db8a@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210210211149.3498db8a@canb.auug.org.au>
X-ClientProxiedBy: BL0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:91::17) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by BL0PR05CA0007.namprd05.prod.outlook.com (2603:10b6:208:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11 via Frontend Transport; Wed, 10 Feb 2021 13:47:43 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1l9pqI-005ukD-65; Wed, 10 Feb 2021 09:47:42 -0400
X-Header: ProcessedBy-CMR-outbound
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612965011; bh=fE9wrQLs05M1Mn/6HILf2376t69HuWUqZmT/HXrY1+4=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
         From:To:CC:Subject:Message-ID:References:Content-Type:
         Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
         X-MS-Exchange-MessageSentRepresentingType:X-Header;
        b=nQjUW1xPdsb8nfBwRnWV07FVddX32uPHV+EjBwLvDvyr0VxiJr63eqIt/Fh2DXPow
         +nMpE7vcLFN5Q8L/UpkMnNFUxT5bkdjAsTK7nwMO0ueok8zWqiJM7tnMpDRRHASjo/
         GrUT7sfN5EFvvyartxoNX/IMlEQel9YY+nRDtwS+wM/Rt0mqaEM70FcaHs/+xAbG8H
         N2uCs704/HT+VmgrjgdSW4HG+PmHdfRY65N2BowZU4tjurInfMm0wwLsaI/MTSFqxk
         qwgck7dqpiyXwGgc6kU4acTi7KrFZz4qicqQW3+xn9u9JFKF5k/63+txg1j2geieVE
         Fi7RblFWIh/Mg==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10, 2021 at 09:11:49PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rdma tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> drivers/infiniband/core/device.c:859: warning: Function parameter or member 'dev' not described in 'ib_port_immutable_read'
> drivers/infiniband/core/device.c:859: warning: Function parameter or member 'port' not described in 'ib_port_immutable_read'
> 
> Introduced by commit
> 
>   7416790e2245 ("RDMA/core: Introduce and use API to read port immutable data")

drivers/infinband is W=1 clean right now in linux-next

But how can I build *only* drivers/infiniband using W=1 so I can keep
it that way?

The rest of the kernel is not clean and creates too much warning noise
to be usable, even with my mini config.

Just doing a 'make W=1 drivers/infiniband' is sort of OK, but then I
end up compiling things twice

Does anyone know a good solution?

Jason




