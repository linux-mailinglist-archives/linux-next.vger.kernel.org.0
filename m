Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32FD91B1B46
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 03:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgDUBem (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 21:34:42 -0400
Received: from m4a0073g.houston.softwaregrp.com ([15.124.2.131]:59460 "EHLO
        m4a0073g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgDUBel (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 21:34:41 -0400
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.147) BY m4a0073g.houston.softwaregrp.com WITH ESMTP;
 Tue, 21 Apr 2020 01:32:23 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 21 Apr 2020 01:34:03 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 21 Apr 2020 01:34:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgdZa7xw5qsYneqktESNnl7kWZRrdyKScTZzq3mv47B1i/nCLCS+U45vOYhQGNozrKgkrI5XqDhBUfPUeTIM/6VE/WuTCnPhY2mW9WQ4ljCC8EuW5S5JMN22b4I+P1ksSXebcmQURHrBVAFCFad04WNl6pyXwS2wmrHpLU22vEwkg/CEt0Hulrt2zhgd9+UvNaRGf+cAGC80F49Y7OhrEEszk36R0gDQihA+5wePqm9axAIm4HDUaUoOyybg7bxKUmEDFbBiTZ/2xdn/IL+5qp6dQVuqQaOdXgAvRGpD0N4BWp3NwVeEu5t1pRsHznNbpZH+potDMh0qvnTlrpwGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu6d/aDrJGZvRb0OoE24Lzjylv7cz0HzEGkAFUIoDII=;
 b=I+wQSzSdWRHSFqNurlvyZ875xBqEANYSE+Er6gYf5dO9kiE3HjgEhePufJYiMAgu/8iNJ8S/niuEZwqlKub/DjG9D4U6rMxEpeEEroniiJ3hwEALsZHhG1V/W/b7btOHKJG6RHXq5/xX5QjIXu34lma28Lbf3CTbXgoY2h2mEbuSXsjsRDxKvvlId6KPNCf0gMqE0fqKp5ldS9iavcCEAsceFgSVopYUHrhrBXzmim89c7zHn8AXy4Ue4tQtD7Y5fUqxLJGYYB+8vq4tS0iowCixbx6Al8Q9ax9K7vrsg+LbehS0vBqU9sHRaZJCzjZ0tzHTraXruf6qLFBasgh/dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is ) smtp.mailfrom=wqu@suse.com; 
Received: from MN2PR18MB2416.namprd18.prod.outlook.com (2603:10b6:208:a9::25)
 by MN2PR18MB2894.namprd18.prod.outlook.com (2603:10b6:208:a0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 01:34:02 +0000
Received: from MN2PR18MB2416.namprd18.prod.outlook.com
 ([fe80::8cf0:641e:631d:7a6]) by MN2PR18MB2416.namprd18.prod.outlook.com
 ([fe80::8cf0:641e:631d:7a6%4]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 01:34:02 +0000
Subject: Re: linux-next: build failure after merge of the btrfs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     David Sterba <dsterba@suse.cz>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200421102520.53623f09@canb.auug.org.au>
 <9aee72df-9140-c86b-cf37-568a546d8b76@suse.com>
 <20200421111324.2148fe05@canb.auug.org.au>
From:   Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 mQENBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAG0GFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPokBTQQTAQgAOAIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJdnDWhAAoJEMI9kfOhJf6oZgoH
 90uqoGyUh5UWtiT9zjUcvlMTCpd/QSgwagDuY+tEdVPaKlcnTNAvZKWSit8VuocjrOFbTLwb
 vZ43n5f/l/1QtwMgQei/RMY2XhW+totimzlHVuxVaIDwkF+zc+pUI6lDPnULZHS3mWhbVr9N
 vZAAYVV7GesyyFpZiNm7GLvLmtEdYbc9OnIAOZb3eKfY3mWEs0eU0MxikcZSOYy3EWY3JES7
 J9pFgBrCn4hF83tPH2sphh1GUFii+AUGBMY/dC6VgMKbCugg+u/dTZEcBXxD17m+UcbucB/k
 F2oxqZBEQrb5SogdIq7Y9dZdlf1m3GRRJTX7eWefZw10HhFhs1mwx7kBDQRZ1YGvAQgAqlPr
 YeBLMv3PAZ75YhQIwH6c4SNcB++hQ9TCT5gIQNw51+SQzkXIGgmzxMIS49cZcE4KXk/kHw5h
 ieQeQZa60BWVRNXwoRI4ib8okgDuMkD5Kz1WEyO149+BZ7HD4/yK0VFJGuvDJR8T7RZwB69u
 VSLjkuNZZmCmDcDzS0c/SJOg5nkxt1iTtgUETb1wNKV6yR9XzRkrEW/qShChyrS9fNN8e9c0
 MQsC4fsyz9Ylx1TOY/IF/c6rqYoEEfwnpdlz0uOM1nA1vK+wdKtXluCa79MdfaeD/dt76Kp/
 o6CAKLLcjU1Iwnkq1HSrYfY3HZWpvV9g84gPwxwxX0uXquHxLwARAQABiQE8BBgBCAAmAhsM
 FiEELd9y5aWlW6idqkLhwj2R86El/qgFAl2cNa4FCQlqTn8ACgkQwj2R86El/qhXBAf/eXLP
 HDNTkHRPxoDnwhscIHJDHlsszke25AFltJQ1adoaYCbsQVv4Mn5rQZ1Gon54IMdxBN3r/B08
 rGVPatIfkycMCShr+rFHPKnExhQ7Wr555fq+sQ1GOwOhr1xLEqAhBMp28u9m8hnkqL36v+AF
 hjTwRtS+tRMZfoG6n72xAj984l56G9NPfs/SOKl6HR0mCDXwJGZAOdtyRmqddi53SXi5N4H1
 jWX1xFshp7nIkRm6hEpISEWr/KKLbAiKKbP0ql5tP5PinJeIBlDv4g/0+aGoGg4dELTnfEVk
 jMC8cJ/LiIaR/OEOF9S2nSeTQoBmusTz+aqkbogvvYGam6uDYw==
Message-ID: <10d92c2f-7120-18bb-1412-e3627d2d8f4c@suse.com>
Date:   Tue, 21 Apr 2020 09:33:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200421111324.2148fe05@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="m9LzV6NvJX7JdFjFaU9IF80JWtWCuasBR"
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR18MB2416.namprd18.prod.outlook.com
 (2603:10b6:208:a9::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [0.0.0.0] (149.28.201.231) by BYAPR08CA0043.namprd08.prod.outlook.com (2603:10b6:a03:117::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Tue, 21 Apr 2020 01:34:00 +0000
X-Originating-IP: [149.28.201.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f688e48-4f20-4a47-9f69-08d7e5941240
X-MS-TrafficTypeDiagnostic: MN2PR18MB2894:
X-Microsoft-Antispam-PRVS: <MN2PR18MB289452338BD3B7E824C94728D6D50@MN2PR18MB2894.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR18MB2416.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(31696002)(52116002)(6706004)(6916009)(4326008)(86362001)(36756003)(478600001)(2906002)(33964004)(54906003)(16576012)(316002)(21480400003)(6486002)(8936002)(26005)(8676002)(81156014)(5660300002)(2616005)(235185007)(956004)(31686004)(6666004)(186003)(16526019)(66946007)(66556008)(66476007)(78286006);DIR:OUT;SFP:1102;
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cbkDA1PI9MF/SrbtZtVJ1FjNEFe9XZKwZ4/9kH+IPh9FM31sK3uAsobhtmgbyrfgj8C23w1qosHnpt+v6/seUcNY8QK/w+V9zOtvJufljeodZJo7jmAA7QHo/KTJmySKex/uEpTF/2lKbSbEbB6wN+7NR0f06iSHNfMep4CtPF5aIaB3RoTJrINfM4QHFsdVQ+4lTp4j4onHOfGaEtu65kw6nepW2HFNV0KOFpFWyEUx5/34A0GqRacmGkO4MFVZIN/zjJDAc447yHuKpgqTpVVLeh2RUdFXeBIZOXONbYjofxtyOFTux53nGxJnJndWTAQa9BoM1nBsS45ZRoYO0q4wqQbihDPI2Qui+Kel10XZSpK41GoS7CEs+Z49Mpv65rZTpsTQ7gwV1uow8xrRrD37tKNJ5GPIZB8yGqrHTTsVtzWr/IN2lZi/WHV1ADjyfjE5b7Zj9WAalyZVDUsxFB1j/eNWMAaCsPjMpFT0JZ8Q3kYmZE5kzmrdN781E2NAii2aYFcxT4d266eAaQyAfCoyI19RGRN1yR8ZZOPMTxU=
X-MS-Exchange-AntiSpam-MessageData: JpYs3okSf0XLRnsUL9DkcrUvaHwL2cplq1aCC4wPDLyWr46YnHtgOz8og8qBxC+FqsAmDkqdRwb63dYRfD51owWCZ6htANZGOPF9BuaYItDKu5WCS2Gjl0TQAj7pFOA8AOanty64/IvyQnQSoWt7Gw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f688e48-4f20-4a47-9f69-08d7e5941240
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 01:34:02.2638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFlgUz7Ejadvmma3f8XnxZzE4Oa4Y74HJITIe0CjSgGg4oznsdskgm5ZCfJ+HOI2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2894
X-OriginatorOrg: suse.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--m9LzV6NvJX7JdFjFaU9IF80JWtWCuasBR
Content-Type: multipart/mixed; boundary="rUTxmzn2VJJGHYXfRSYdHDlElPAeI2lti"

--rUTxmzn2VJJGHYXfRSYdHDlElPAeI2lti
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 2020/4/21 =E4=B8=8A=E5=8D=889:13, Stephen Rothwell wrote:
> Hi Qu,
>=20
> On Tue, 21 Apr 2020 08:40:45 +0800 Qu Wenruo <wqu@suse.com> wrote:
>>
>> On 2020/4/21 =E4=B8=8A=E5=8D=888:25, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the btrfs tree, today's linux-next build (x86_64
>>> allmodconfig) failed like this:
>>>
>>> In file included from <command-line>:32: =20
>>
>> Any extra info?
>=20
> That is a build test of the uapi headers to make syre that they are
> self contained.

Any command to reproduce it?
As I want to avoid such problem in future development.

>=20
>> It builds fine in my environment, with older HEAD though.
>>
>> Is there any new commits which changed <linux/types.h> header?
>> As it should includes u8 typedef.
>=20
> My understanding is that you should only use the __ versions of the
> kernel types in uapi headers to avoid namespace contamination.
>=20
Thanks for the hint,
Qu


--rUTxmzn2VJJGHYXfRSYdHDlElPAeI2lti--

--m9LzV6NvJX7JdFjFaU9IF80JWtWCuasBR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELd9y5aWlW6idqkLhwj2R86El/qgFAl6eTYQACgkQwj2R86El
/qgNigf+N5lKFCiuMxS/SLVlBG00EgC5vUx8qWFBvoTeB7muBrz+FrxRqsh8/TCQ
mj0YZtgScU5JbaNbZPd920tMebDKbl8dSQ8BuK3mli4Rboc3vX6HwMYyzXXFmp+j
yE5Vnp0bSAFdZ3nS2ZANvpU2KbKJGC7Vc/hxp+8u6DcmClzO0nDu0nnTZGsMNAjQ
xLXRa0HN357QLEb3MQmZyBnHBtzy5vZHe9xFdSqcO8awuOWfRpZenGWNqHZ46bRV
nK4wZeQWVPvUFwK7psGTlR6HRiZArY+5TsZhbKjq2U4lhQn/YHU8TV+IDUYAIVlF
Zsb833fx3N3MVLnO4d4jPpEDj6mlhA==
=W/Yt
-----END PGP SIGNATURE-----

--m9LzV6NvJX7JdFjFaU9IF80JWtWCuasBR--
