Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750D72305C1
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 10:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbgG1Ivx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 04:51:53 -0400
Received: from mail-eopbgr70072.outbound.protection.outlook.com ([40.107.7.72]:64228
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726032AbgG1Ivx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Jul 2020 04:51:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crAeQbama/jr7bHRzULtDWjW2q7B26S+i435zRaFkVr2K4QzPzTM+aShXoC0CjmgBFZZ3PZodK5pPv7hoZKoeqX3qT8dzznIoK6U0wDvMN4FSq52fM5ZL1zQlYX2RZjdVw7DRcUq8w96uZLBij+9iExR73GLjT6HY6ajCVP9EZrlKFh+aTyKSSDQMbEmqqMMG1CymUF+uX+7Rvvr1su7k5QeiNbynJrZaIwlqR+NC4ylDS5KbIsybbLyFEldOkGbg5BTmRyX6QI7RKqZaSsiA6NdVrNgCSFEEO0vT8BfkdIAejMdy+GIKbMLPDa7oYH2grXU/afRGu6frW2YDfBKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrqbOsupbQq6kxmsi9SPcA/PjpAmvTyvgyjhGHsX6vE=;
 b=AADOR5GyNYwIfEi0fhdMBSqU16uRJO+18RB/q3kvUp6QthoowKmxpG0I6JNclXgQJ9N8134cMeQobPrMC7M64rGuCwXmagZBheNHj7i+B+vw776aO8Jeaw+zJ9XvHsER2JS/QnlbzYtobRqxMj+kSoSd3/UPx7BXJUknxeee9E7hR7N7/9sOiR4rmtCiLav3+nRFzGk1TgANkdsbZC4/PQChxBEFI8udUgZXlWnoAnqt2UQDYMg84uPKj73GTqg3PNt/TNkMwR7n57l+w5O3RewH8PsX23UJNJ4uWu3mBvdpkV7ySSrojImQdHRAar6MscZfDuDZ7yEtVKB8ZWvffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrqbOsupbQq6kxmsi9SPcA/PjpAmvTyvgyjhGHsX6vE=;
 b=rXPKI3ETBmCI4j1neg/Kwv99gtMrTF9AbsnXXIzmK7te8h3/0lpieeRIfh1/xS9RaYeB9s/NBZnPVsoITLDwuXVo5ipcP9D50zMuQXINVFPlq1Z3xliUngXXwwoBWDrd4Q7SJJMovNsS2lukznoo8KOKeQu+UiblLSJQCSBWjgk=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=mellanox.com;
Received: from AM6PR05MB6408.eurprd05.prod.outlook.com (2603:10a6:20b:b8::23)
 by AM5PR0501MB2562.eurprd05.prod.outlook.com (2603:10a6:203:c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.28; Tue, 28 Jul
 2020 08:51:49 +0000
Received: from AM6PR05MB6408.eurprd05.prod.outlook.com
 ([fe80::15f4:b130:d907:ce72]) by AM6PR05MB6408.eurprd05.prod.outlook.com
 ([fe80::15f4:b130:d907:ce72%6]) with mapi id 15.20.3216.034; Tue, 28 Jul 2020
 08:51:49 +0000
Date:   Tue, 28 Jul 2020 11:51:46 +0300
From:   Leon Romanovsky <leonro@mellanox.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@chromium.org>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kspp tree with the rdma tree
Message-ID: <20200728085146.GE75549@unreal>
References: <20200728184520.5634a0a0@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20200728184520.5634a0a0@canb.auug.org.au>
X-ClientProxiedBy: AM0P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::12) To AM6PR05MB6408.eurprd05.prod.outlook.com
 (2603:10a6:20b:b8::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (213.57.247.131) by AM0P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend Transport; Tue, 28 Jul 2020 08:51:48 +0000
X-Originating-IP: [213.57.247.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc6fc861-41ec-44f9-8b94-08d832d376dd
X-MS-TrafficTypeDiagnostic: AM5PR0501MB2562:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0501MB2562502DBC8F64B6B0BC0109B0730@AM5PR0501MB2562.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rgcnp/6PTujgIFFZvu0sUBSM7LoX3fhZAQSbiV3eudc4/u+vHWuVQr9vL2PbljK4yC6IrXtD1yGGkWniedbFDS71mv9O//PZggK9o0OXddakP7qzDq916KLRUurw/j9D4iT31UCbdet3LYYwkXVwxMpPGL0OZZ44+JQ1g5m6/V/2Qogr4tB+70INnNLE2QyoupyiOZ2eB4bCFV1Pp39VklomenzCQ2DY1SqCVoQWFSod5kFPeGH1VXdjzWAJqI/8NAgfHvDnJN6I30ZUeyx7DrUXkr5qMUiOaurrcJ0bxMPp2GCgNbemqBBkYRv5i3YbrF6MUoS2+MITSI1NQo2E4lPSOH57peNo0uS1wNMWiV9MT/bPcpUYb+ISc/ljBaV7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB6408.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(396003)(39860400002)(346002)(376002)(366004)(136003)(5660300002)(66556008)(1076003)(66476007)(66946007)(6486002)(16526019)(186003)(6916009)(4326008)(26005)(33716001)(956004)(44144004)(8676002)(478600001)(6496006)(8936002)(9686003)(52116002)(2906002)(54906003)(86362001)(316002)(21480400003)(33656002)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: UcuWNGe0N6d/n04ppZ6KftU54YLvZtYZJ2+wAE1w4i1+rVkl5rHfPHROCpKL+Mwsidvt13t++9HwvWxINt4H2c8dQnFqM5g34FS1946Xw3iJFCExYQDtmcPXrlkKI93gpnMfdvTrxxBBbP7ZjB7mTsi8QIWquHtPqjNatY1Dksanq7MGPoaD9wyTAq0suG1ejFwWfGyzcVtM3yT7yj+VG2uVLv7sZsqI3of1LCFH5wqYqekQ+82KWqfYyYZgyltJ9hIAZ6Wz07QndOwEX9a4tmxNaT/itzJ05LciGh129KegG/3tY7yjfAwZhUMMSQKZIm3ZtZUVOnb7XvzJP7W9NKhQq82QPAa1ACo7AkDWPIsV9Orxxg+cI870aHHKdjuX+5C5lGwMJm++dZNu8PITHI0w1H5PfxYrWT+ucn5/Q4rz7AVgRS15CcwH3To+7rMx7NQeQ1hERq7KNaTulRU/oU45DUHomdByeC1w4+WuZyCWPrD0r0yZqugxdRLeaZfa
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6fc861-41ec-44f9-8b94-08d832d376dd
X-MS-Exchange-CrossTenant-AuthSource: AM6PR05MB6408.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 08:51:48.9062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsE+hiwMdaTKrd69rUqKKtmtZrF71e+soz4c4l53Soenq+Z9cmO9nH/sc6sBoxDeySU2Nh2pBme1f3iR7A9QEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0501MB2562
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 28, 2020 at 06:45:20PM +1000, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the kspp tree got a conflict in:
>
>   drivers/infiniband/core/uverbs_cmd.c
>
> between commit:
>
>   29f3fe1d6854 ("RDMA/uverbs: Remove redundant assignments")
>
> from the rdma tree and commit:
>
>   3f649ab728cd ("treewide: Remove uninitialized_var() usage")
>
> from the kspp tree.
>
> I fixed it up (the former basically did what the latter did, so I used
> the former version) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

Thanks Stephen,
The 29f3fe1d6854 > 3f649ab728cd for drivers/infiniband/core.

>
> --
> Cheers,
> Stephen Rothwell



--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQT1m3YD37UfMCUQBNwp8NhrnBAZsQUCXx/nIAAKCRAp8NhrnBAZ
sTqzAP9zz1l7DuNxhgHs80hPuIC1IXHBQUSr9w/fCn6lQ2RMhAD7BCGkq5rLAtuq
bADyraF7iWYreEpJ+RE2OhiZS3m+xgM=
=WeLP
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
