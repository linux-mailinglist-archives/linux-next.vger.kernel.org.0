Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8652A374A
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 00:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgKBXpq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 18:45:46 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1277 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgKBXpm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 18:45:42 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa09a2a0000>; Mon, 02 Nov 2020 15:45:46 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Nov
 2020 23:45:41 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 2 Nov 2020 23:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjFqvi+YjEM7A5lwAo6E9o2veihpOpFDJoCRfO/KA6IiepMZ2i3uB5fZaOVFn1tRVzCNjJ7snuLmxLxiRRgCicKdORlHjNZiX/nXWcNu5jym56dncK4Mnn2WsyxSd8RoI0aegh4r2FrlRsEZBep1RWYrhPEB00ydBiXue1yLmFwk6qseNVzYRpbuxaXPdUNrT4KKOBht5jjjrPMN9dl644CTn68s5ScZl9tzeXRoo20prOczubUFohVeV4rERedvu7YtNLcS0lf+20mLesoCYDqEZemizZKjfuHH3N+ZZd7Q+OqC0muFnOxn8UfnFIwp8SWfSnKVyH1aNbjXrPKa8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmI+J98bp4TdrlGnE/JIUelfyqOoGsGi2OULvrrG2JU=;
 b=LEOaF97MsnLP1lDbm3MZJbp4g0haYutwJdkeyFRKf8xsruZwaLP/vBv/MhCC1u9c6et7JJm9SsyxUaxfNfaDVp6EKAvwOks1Rf2lTtLhX0++HVgcYb3ysUZVZOg/NiephwFAOt/vO07odhALQjkMRBv5xny5didFj7hGvLyK+9QvJ6XqaLYtvnXCUCrMqaybyH3bsSP6jGuThO+UZHnJ/duwSbBMWGeI/yyxsFQEKKF3Z15pGB+P1IslWzmA9vrxc8I/cgeeOLy3BIv6r6XIV3p5g6UP7xjmsaa4OUd6dLAsRN6M9TMwW9F2KeJOxjwgLP7A1IdWcCjtGbLxqY0kfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR1201MB0202.namprd12.prod.outlook.com (2603:10b6:4:4d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 23:45:40 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 23:45:40 +0000
Date:   Mon, 2 Nov 2020 19:45:39 -0400
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Doug Ledford <dledford@redhat.com>,
        Bob Pearson <rpearsonhpe@gmail.com>,
        Selvin Xavier <selvin.xavier@broadcom.com>,
        Devesh Sharma <devesh.sharma@broadcom.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tags need some work in the rdma tree
Message-ID: <20201102234539.GK2620339@nvidia.com>
References: <20201103083730.539fe81c@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201103083730.539fe81c@canb.auug.org.au>
X-ClientProxiedBy: MN2PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:208:236::9) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by MN2PR05CA0040.namprd05.prod.outlook.com (2603:10b6:208:236::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Mon, 2 Nov 2020 23:45:40 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1kZjW7-00Fh7W-C2; Mon, 02 Nov 2020 19:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604360746; bh=hmI+J98bp4TdrlGnE/JIUelfyqOoGsGi2OULvrrG2JU=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
         From:To:CC:Subject:Message-ID:References:Content-Type:
         Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
         X-MS-Exchange-MessageSentRepresentingType;
        b=CKA5UezzriZTuy/YHBavXoQofdCSbXrjDO3FHvwixLQo+dOVSVdlkGl1XPF8uZDMa
         n84tgL59CBPBeN6H1aBXr65YpoqsUGGg+I702F5buiGOJuOlHdGkiHjS+TdPgs1txe
         IzHKHJQ1VPA/gpYmE6lDTQdai2Go21ikIMKydjF2M93zmmmT0Q6t5aZTsQMopQOBcC
         WmSH3j8O5fUGDIdTHpI9N9kNtwyBS2fc+s0kJaPWw2i7Xw3Yj/UHpDgOr3IsLvpXvu
         zAUM6HIMhDlKLixqro7UDxC30V07ttZqGPioqqKm1CNZuwaXEeC8ZuvKQO45ldWm8U
         5PJFc1LYeXrOw==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 03, 2020 at 08:37:30AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   32fabd9b163b ("RDMA/rxe: Compute PSN windows correctly")
> 
> Fixes tag
> 
>   Fixes: 8700e3e7c485 ("Soft RoCE (RXE) - The software RoCE driver")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'
> 
> Maybe you meant
> 
> Fixes: 8700e3e7c485 ("Soft RoCE driver")
> 
> In commit
> 
>   b67ffe884bdd ("RDMA/bnxt_re: Fix entry size during SRQ create")
> 
> Fixes tag
> 
>   Fixes: 2bb3c32c5c5f ("RDMA/bnxt_re: Change wr posting logic to accommodate  variable wqes")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

I don't usually like to rebase this tree, but I just pushed this, so
lets fix them.

My checker script noticed but I didn't notice the output in all the
other spam :\

I would be happy if the 0-day folks could run these checks too

Jason
