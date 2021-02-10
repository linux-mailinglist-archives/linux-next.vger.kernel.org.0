Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BC4317179
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 21:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbhBJUh2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 15:37:28 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1160 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232164AbhBJUh0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 15:37:26 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B602443dc0000>; Wed, 10 Feb 2021 12:36:44 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Feb
 2021 20:36:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 10 Feb 2021 20:36:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLkZ0nyeA3eTviQNuytse6YuvjjDUcjB8GrR7rdf7Cf2Ld/1PAz6D6dncuE3TeT1fEN432slzaQG9gHMiENW/CMhyIxCb14/1ncymRaNAKHBt6twVZEoKxO8Q2zv7GNFMtsYIuAh149955KdbRdaNzIaENKWoJ1Lz9WSHqqYtbud/IeFhDdtYGz4MNmDuIIca7vm9hzQFU7Ivbky3zkvBm9gi1kV9DA8X2PyTkN2m//MTcvQ7RZQgm5gZCILAFGmMd0/gNTM9Qn+QfzP3Q1isvnRKjdreCZaU4dSHCXcqC+KYqhtTixxyoeUBZPAiCSwAqzOY9HUsjoqlNUw0wZvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB2khyyuZBH8C7YPXIuhUnxN+QIrDWDKTGQDY0EKefk=;
 b=VsZzd0NgespBpsPLbwBXzLI7GtfMjOqm1lineyw9fHZ6tNWTQp+F6xJBjelpIfjqT3eKwbcAlbQgncablh0e2DlkZb7cZ1IYw557BH/wdbe3dHVvqCtcfbOJ4AyQ8cGoK5Nu4aXE2dLhFZmRiKp+9Dp07l9Tp04ujejexvYYiEqlq+E1VdEQxEVGtNncQs8Yv2VLbnnF+0Xp9jQHzmxUDWFF+ebB+hWNQTe8AWo36Zk2Fs7kTTAwi6W+htNdNWCBTq2leSFjjpzprA20ystmLh0xh2e1/QBigB1C8LqzXxTPvvP1xtc/HfF+oXbaPxvPBuyOINIuoYUhD3kw37Jwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4943.namprd12.prod.outlook.com (2603:10b6:5:1bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 10 Feb
 2021 20:36:43 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::d6b:736:fa28:5e4]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::d6b:736:fa28:5e4%7]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 20:36:43 +0000
Date:   Wed, 10 Feb 2021 16:36:41 -0400
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     "Pearson, Robert B" <robert.pearson2@hpe.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Bob Pearson <rpearsonhpe@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Wilck <mwilck@suse.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20210210203641.GG4247@nvidia.com>
References: <20210210131542.215ea67c@canb.auug.org.au>
 <CS1PR8401MB0821C1E95BE58300FF3B87C8BC8D9@CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CS1PR8401MB0821C1E95BE58300FF3B87C8BC8D9@CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM>
X-ClientProxiedBy: MN2PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:208:160::30) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by MN2PR13CA0017.namprd13.prod.outlook.com (2603:10b6:208:160::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Wed, 10 Feb 2021 20:36:42 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1l9wE5-006EJN-OS; Wed, 10 Feb 2021 16:36:41 -0400
X-Header: ProcessedBy-CMR-outbound
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612989404; bh=CB2khyyuZBH8C7YPXIuhUnxN+QIrDWDKTGQDY0EKefk=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
         From:To:CC:Subject:Message-ID:References:Content-Type:
         Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
         X-MS-Exchange-MessageSentRepresentingType:X-Header;
        b=Y47YSrdLcCYDgrlyVSEOOpoDisEmW3FacadXtHyVMdLEK8qbioMwuDxnyG74kbHAT
         7LpmX8q/f41da9fotXm71BM6CcZyh5LszqZUq9X2ria2hGZBNGCDxZdAnxBjQhKFVs
         FMOnBhJpzxO4dq215qsXegYtfvsKFN5O//WnhM89PyHN18xRrwFNW52wkwOa+/ql52
         9IM1irtkuFW7ZB9nE4Vv1kMyHMAPFeJtU3xJuRuA9Yy3UsYYs6ntr9NuD29DPcjsm3
         chSlZL55B0Rxqay4RIUakl54Tjk9KW2cN5fYssEneUaRT8VherpyIPDMOoUHN9nnVV
         cMWxlNCOofJ4g==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10, 2021 at 06:57:24PM +0000, Pearson, Robert B wrote:

> It looks like f1b0a8ea9f12 ("Revert "RDMA/rxe: Remove VLAN code
> leftovers from RXE"") has not been applied to rdma for-next which is
> where I do my work. Not sure how it got upstream.

It was sent to the rc tree, don't worry this is stuff I fix up.

Stephen's note is to help ensure it is fixed properly, does the change
look OK? It looks like this when applied (I changed Stephen's slightly)

static int rxe_udp_encap_recv(struct sock *sk, struct sk_buff *skb)
{
	struct udphdr *udph;
	struct rxe_dev *rxe;
	struct net_device *ndev = skb->dev;
	struct rxe_pkt_info *pkt = SKB_TO_PKT(skb);

	/* takes a reference on rxe->ib_dev
	 * drop when skb is freed
	 */
	rxe = rxe_get_dev_from_net(ndev);
	if (!rxe && is_vlan_dev(rdev))
		rxe = rxe_get_dev_from_net(vlan_dev_real_dev(ndev));
	if (!rxe)
		goto drop;

Jason
