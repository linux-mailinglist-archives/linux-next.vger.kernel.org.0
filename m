Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F221369456
	for <lists+linux-next@lfdr.de>; Fri, 23 Apr 2021 16:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbhDWOFP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Apr 2021 10:05:15 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47622 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231281AbhDWOFJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Apr 2021 10:05:09 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 78B97C00E6;
        Fri, 23 Apr 2021 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619186671; bh=F25TZesxYrcIWpFGMCcxaprImHLY7H56V0m5IcaXX+w=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=PymJh43U0Gj1IvcN7iwaXzRqWYAdhknEtT+ZAhsC5Xh0xfoUuqNkWanqHeG7Ac7FI
         JSrWe0T4DW49n7zrVRRyWWP++EWADHRPVui2Wo4RdFMdROO1/NMTPVqZ+XcVyjWzg5
         p9DdVZosIMBEXXQSPgZFyfScTb6qieCquiPD/9i8R+P4yrtExCwr3Z1XvqLU3edBLz
         A3xxBSifApdTqz/xWK2rOkFQEkGB6Xf9E/yqyeaNwglgOrYDxbfOGrN0W8POo6l1Wl
         q0lC/l/9AqXnLGAmkwCzzY0J1oN+y/VfDY2L40HyuDYAZWq8JUtoJbIEvzSrLHP0K/
         gSb8cqqZkdPhA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 66889A006F;
        Fri, 23 Apr 2021 14:04:23 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 60D54400A4;
        Fri, 23 Apr 2021 14:04:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="sF4jbmqV";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRkzpnYxF7VqfPOirSoDWJUygcXWwtAE7RajKPl50MGCVBxTK6jLP6EzKSzaFv/8MbiuKHochr82XTePD5Xwp+vlfFbevpyvIY5VTaXJ/lorfODy94EOE8RmKFflCmYJDRNyQb5a7fLDnu4O50xhsjj44qfQQ3sTsCEq+oPHu6SqmclKR073sYByIhYlL0M/RKG1CTNPBhupQh7nbBHfPkNYBr4zsjKn8M78WVRx4qOmK5JeGnNtGFZEmOStpQwOh4nH3SleQvdpjGASvDs1s6KW74sQqcZNofh5OHrAxSDtj8UDrRcUop1+qGv5cR/No29coVeWQ5wCXZxiGwqyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2b1Xsx6236BlZI0gOlgf9vj5qFFKCoB+EpH2FgESoE=;
 b=MIvJVF/rkp9OPZP5Sh4jFnGrKSxDQm4Y6MXChMsEpljfBQMkJPx27JXw4fSyUTOctejGXzp+HwopiuhPdpWT4WDbuXm9e7E99u4TtEStiBMEV5XqOYloiQ/knpGUipbRmhlDSlylRFex88H0kCHDatY0j08DuA74myAi2dCDr4icXq2Ps6zkdErEhMHLlxTYR0Xjr2Xkjb6fP7AYago+oZdcFLJILxYv0uxNkxpuQBLEfYnkNH1ndKb0vkG055AfS0TF+Z+/WLg1TFimRRSPOeRxJJOkNI6vAUHEGCFTTqm8kNaRdoZazkucl+FYVRvn9JdzHV+OwIHqrYDJ0NOb8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2b1Xsx6236BlZI0gOlgf9vj5qFFKCoB+EpH2FgESoE=;
 b=sF4jbmqVf9ihSDO3saO/0OiFoB0vBy/XOfl0SWq62LaP6VTNUee+tl89eWFJE77VGrmm7JVl2raboow+06CSk6GCLR+sstZC5jfVHfwwNfXevq7DPe6twWuLmpsObOlhw4DXZ2KIwIyYGzQHMlHocEta8DiruYVazmC8XkPXr5E=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3924.namprd12.prod.outlook.com (2603:10b6:a03:1af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 23 Apr
 2021 14:04:18 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 14:04:18 +0000
X-SNPS-Relay: synopsys.com
From:   Vineet Gupta <Vineet.Gupta1@synopsys.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>
CC:     Jesper Dangaard Brouer <brouer@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Mel Gorman <mgorman@techsingularity.net>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 arc-current tree
Thread-Topic: linux-next: manual merge of the akpm-current tree with the
 arc-current tree
Thread-Index: AQHXOBGkg1I5+OF+v0i2ZmOtZID1cqrCIvWA
Date:   Fri, 23 Apr 2021 14:04:18 +0000
Message-ID: <96a18d65-8c50-e4c2-10bf-c762ad4a74ac@synopsys.com>
References: <20210423172351.4e3d194b@canb.auug.org.au>
In-Reply-To: <20210423172351.4e3d194b@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02ae45df-2dfd-41ad-466e-08d90660afda
x-ms-traffictypediagnostic: BY5PR12MB3924:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3924F27416DE91EFE5695A29B6459@BY5PR12MB3924.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: heXgKm+qztKzzGbdOyGSBndRnLsVVdAcUc+l2IYavN9GWH320HH6Ur3Kc3D+56A/eDKTFIF1M2xR8WLTl95OayiWLXmKANDuP8j07+3UfXmpTNRyZDlNU/9soH7sL4hk+nUDqi9jKhmZ5bjv4Td+l4V/oSvDXTEJDd4HtHqGWC65AuIpVeX8Ck8U/jOhDEUivcsDov69uy5S8HR0cvF4lvm0Tt29bDUS5e9fXnahgK/rdqFRum0Sn1GnCaqEbfYl5FgP/vsSdYbB6nWeQoMlaecjdGEMVSxyf2HNkgFdn8wmwh99gCHfaf1otW958+vGY2XTl3AD8KNuJUgUezIoblmIaYxEGyBzCReKTQCX+XR7fl2aekqXSYP5SuzNjHr9Tp+YRWSJmhI3Ci7ipP4X2oyqRrsWLp6uvmYp0qsifpbNFzYRc36g0xSFvnt8Z9pMk8XwyiUMHxel3lxFUlBzHouaPBcWi4/SvWFe92/OD2g6sTpzVM8/I4lxOMNovmkipXFPswworZjHrBgR5QENzOmPa/pYZmtbWGsCGvaUfE6ISaMmxWvXHxAQgexMdGjrtL1SF+T6yjWFFEZ6cOU1Wsp199LRaI0Nbrm5nQ9gyn+lnVGZWrcWdWDK7tLefEC3s9rihpHkzuJ3bUc709UaGGMcQ5B1JrxMVRuSWSpakeROiBL74s0iN3JbXlVo5uJt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3479.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(366004)(39860400002)(376002)(66946007)(64756008)(76116006)(38100700002)(6506007)(66446008)(6512007)(66476007)(53546011)(122000001)(66556008)(71200400001)(31686004)(2906002)(186003)(6486002)(478600001)(4326008)(31696002)(2616005)(86362001)(8936002)(316002)(5660300002)(36756003)(4744005)(110136005)(54906003)(26005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?b/2tbjz8Faw+UXGONc9pMXcmmr78rpMu3TxdXdwu2RIVaYOvnuAjsAO/?=
 =?Windows-1252?Q?BADSu+WYOrPD7wac/F4FN00xOUCr/cAFl1oyQr/vAELRJpWD60Q026Vh?=
 =?Windows-1252?Q?P4P/lk812yKqBhDPa+u6oCgjhn6WCPqsVLhdlUS1GpHjjNz0IaCeurx8?=
 =?Windows-1252?Q?qBEyYRAfCS6h67sQP/j7v2iqWed4o3UMsz8GFDyLqXRokU4OXit8lLbt?=
 =?Windows-1252?Q?fbCs/DKiDZzHtBZiz5Oyj0aIsyl07KDdYq53XzSszC5VAg5P9JoY0+PZ?=
 =?Windows-1252?Q?PwQvmLZc92k1Wp15uoxTvK+bolmYvBC4AX/NuadOyjASLdtOC+cWUNHw?=
 =?Windows-1252?Q?DA+137Ia4J8h4E+2rphGXtcwXVkI7R+IdG7jPe/kghREnKkXq5Hzbwdg?=
 =?Windows-1252?Q?49fWailpBUfEBh+ipdRD9YTIUX6zZZTvXMttgJhZSAjh/KG/Ifg9avjT?=
 =?Windows-1252?Q?r/QCO22bo+Ue/55lM3wq0h+9WQV0AFOcYqnT6GSJzyNgLjjvMm5ZCZeN?=
 =?Windows-1252?Q?e42NoJJ9qFaSWZoSi7jIQnJ+fk4pVgDO5TXQtpx+kZzXorR/pURdAj4Z?=
 =?Windows-1252?Q?jWUXC97wWdFeXCTEiArqbtVBaJshAx/mj9arxWTw8VM3XL8PlzRw8Ej/?=
 =?Windows-1252?Q?Xy6LGNnCF7W9DdkqOOrGWHKjZgdR2lMfNz9iwRKahxpIrtOtC9og0FKr?=
 =?Windows-1252?Q?y4aQ+UzRzqBOgjSc21lNK1D6g5k/IEWGAzPmrJWMUycMjvHytlVZwydG?=
 =?Windows-1252?Q?clno4H7oQyg+hrRPyQoYj+j3wRdlqD+jidar1Btn58I9YruKWRVY3Wh6?=
 =?Windows-1252?Q?/BJGEoWJ3QVqNigHc3kXdNfj88JtvR/jfkvTMJhLMitANV1hmG0PfMEe?=
 =?Windows-1252?Q?PTbBoMfrOuXtMM1NtA6/sh/PGM+84Im5vesrbRmTD4DSe07+bSCWbrlF?=
 =?Windows-1252?Q?DGJChP2fQAulHuB3Up73FPtSwvi7tNbLQj8qI3oRjUt0QJRsITuCEBAb?=
 =?Windows-1252?Q?0pByRReOzBxWqCNkkLHRWei0s49I5IfvC79yVbAjsKYow3P53E/1X92l?=
 =?Windows-1252?Q?p4KGrn6C39KNquTyIglBDDWEXmLZtgjVSPTpcDwLzKLp7kpPUThAoMHW?=
 =?Windows-1252?Q?r8XkK33xSr1HsdLKzvtqOeDSzC+7goGp0vH5zTbsavoMb6KRbwJcSqOv?=
 =?Windows-1252?Q?CnesgJTdupmU+a0+kI5suh0WKLmXR3IxFAKx+Z+KBE+oerpKxC1PwA5s?=
 =?Windows-1252?Q?1kqpM16fNi8wjHazo4tZqRUCgQPLOGoptT4pnWV/CufeCvgvj5A1EKuI?=
 =?Windows-1252?Q?XJrmkdTOFG6PqCgM/V3wkaAXXEv2tgWGDBrSTroPbbSG4jaBs+VRPBVy?=
 =?Windows-1252?Q?sX9jejV6HFmkgDRmKTUt1mm7L6of74el6xg=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <ABF79497B1F0034FB983B484ABEFB552@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ae45df-2dfd-41ad-466e-08d90660afda
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2021 14:04:18.5311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c4N1+zIH+lnydPkmyoBhuLhNBQN+KhwXdLa9R4S7z6kVnN3WvaRnAaxMmgr68lnkZamRKji4ixYUlW+lbQ4Spg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3924
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/23/21 12:23 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>    net/core/page_pool.c
>
> between commit:
>
>    004f078a57d3 ("mm: Fix struct page layout on 32-bit systems")
>
> from the arc-current tree and commit:
>
>    8fdd71a69f19 ("net: page_pool: refactor dma_map into own function page=
_pool_dma_map")
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Sorry this was a snafu at my end - I pushed wrong local branch (to test=20
Matthew's changes)
Its fixed now.

Thx,
-Vineet
