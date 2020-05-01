Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F54A1C0BF2
	for <lists+linux-next@lfdr.de>; Fri,  1 May 2020 04:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727934AbgEACG7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Apr 2020 22:06:59 -0400
Received: from m9a0014g.houston.softwaregrp.com ([15.124.64.90]:33378 "EHLO
        m9a0014g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727889AbgEACG6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Apr 2020 22:06:58 -0400
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY m9a0014g.houston.softwaregrp.com WITH ESMTP;
 Fri,  1 May 2020 02:06:16 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 1 May 2020 02:06:11 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 1 May 2020 02:06:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlD0WJdcfoIqcmvTRMkKCrcvXa7vDB2dJJ56dY7Erfn4bWq/aLGoKgJ+xTIA8xjokA7lVdWIjoC9+ShgHCHWcQapVZrfQsTlg8jaXoueIZGCX4zRPed1RlObodIT9fQMhZxuTLtrzwAtsJA0QT0PxZ+bJP2c40m7OE7aiuGnmcihiRju+eMXkMFjsGwr2W5w0GWMegMMS2QcerDVWZNFPYXPr+vO6LTHQP3hW2vAQC3tMY38A6499uxEP0pd/T2g3ooomOf8x9dkKlb2hVdCuX/7JD09KeGMGFf0vnPQezNCvYk+kb4lb7sbydw4PG0OVArbbERcPjD1ACrxeyyNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPuAif0I1qnYRWSt3rpDW0xRDYROJC7sg3ILjhLzCpw=;
 b=NW+pk4QDDp3KYy3gi/GzoDUZEZybkojhjtNpHUesj10fasgeAlrbxo+BbkT8EDgZYgrPEjv9t/O95EVdtFsaeYpqxOFoKwUX4R8vPdqPJqwiCoCAdQE7WELomgmP8vxOuAZoZOjEmynCV9l1rYSZCNkrm4ZtsYkG01A0GiCSkaVDf8WGnkKZctkhvW8ZLXrXPorDUYMx0POaXxHd+LHpfGnSUg4cglbyn9yrd82kYsfZi+p1uADHKpgzf25vx3Jdkq5swIKBgwe/vz4gEKSJyJ7XP4MS90qE7dgGJID6+R7ympvFVtNcSEdc9FqLjt8PpwWsvMugn0DCVMNuKEvnUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: toxicpanda.com; dkim=none (message not signed)
 header.d=none;toxicpanda.com; dmarc=none action=none header.from=suse.com;
Received: from MN2PR18MB2416.namprd18.prod.outlook.com (2603:10b6:208:a9::25)
 by MN2PR18MB3447.namprd18.prod.outlook.com (2603:10b6:208:26d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 02:06:09 +0000
Received: from MN2PR18MB2416.namprd18.prod.outlook.com
 ([fe80::8cf0:641e:631d:7a6]) by MN2PR18MB2416.namprd18.prod.outlook.com
 ([fe80::8cf0:641e:631d:7a6%4]) with mapi id 15.20.2937.028; Fri, 1 May 2020
 02:06:08 +0000
Subject: Re: linux-next: manual merge of the btrfs tree with the btrfs-fixes
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Sterba <dsterba@suse.cz>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josef Bacik <josef@toxicpanda.com>
References: <20200501102453.4b80d290@canb.auug.org.au>
 <20200501110558.586c1d07@canb.auug.org.au>
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
Message-ID: <48fbead1-bd3b-e182-6916-1c3652d4de08@suse.com>
Date:   Fri, 1 May 2020 10:06:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200501110558.586c1d07@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="mlBc0qm6MnsL2qfir5K0ixhmA1g1kT8qE"
X-ClientProxiedBy: BYAPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::14) To MN2PR18MB2416.namprd18.prod.outlook.com
 (2603:10b6:208:a9::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [0.0.0.0] (149.28.201.231) by BYAPR02CA0001.namprd02.prod.outlook.com (2603:10b6:a02:ee::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 02:06:06 +0000
X-Originating-IP: [149.28.201.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63981052-7ec6-42eb-14b1-08d7ed743663
X-MS-TrafficTypeDiagnostic: MN2PR18MB3447:
X-Microsoft-Antispam-PRVS: <MN2PR18MB3447CCCC108E85826F3A913AD6AB0@MN2PR18MB3447.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjP4Z0xCnbJuNBYdBlCZhEL6gEvoDH8XyJdKnym6ZOP5l0InnGP7A37EB/nCDCF5HrebQ8bzwDE0oKP96VuVZ2vmHSGmxwgsKZieV6uZZHsCmp6yRHkVAYL6Gjq8F+2dc/mt7OckNrTAKAS2OGFhAyF0xVPbMX5/EVO688HCfyi325oxqoPFExLKLe/QvR82DX5ZoQXWYOqMT7ky6YdAep5WvmAjTcFlBsZmpPpAHahAVq2RMefuoKOMgvULNSMopXEvwTUTZ7Vr582655DSTTLhzedrQeczV60WqGfJx5PANIArgBGI6LLG3ieATxTp+u16J4uUyNSidrJ7/kmzsOt9qtDpksMcE9hTmrzcJ1ZmAMgnORZp7v0C/DtKy/InW8PGfs7hIwInWEkXHeGcFCof422x0za2b0gym4jom/7AN0b7t1cfSJAnrKt5nctrWysSAcJgd19ZjuUmsIsfv8QRLM+cL091QM2m06CA9O+2T0Lo50qkowi6Zw8Fml7E+pQbB8ks8KldzYsCzkDQun2lreasOke2cSzJTi0/DuM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR18MB2416.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(36756003)(54906003)(478600001)(8936002)(110136005)(16576012)(26005)(235185007)(31696002)(6486002)(5660300002)(2906002)(86362001)(6706004)(8676002)(316002)(6666004)(16526019)(66476007)(186003)(66946007)(66556008)(2616005)(956004)(31686004)(4326008)(33964004)(21480400003)(52116002)(78286006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: in1D2m2xcnXL6T+N49x3d/dOz5S/h7J2GqPIWQHvfQ96aAwLogtHs8Wzti3K6Uoo36bZLOaQe9m+R0tqqbO/GUFH5uo15sl8VvRdcqjPh4IQNadDX+9Yvi20E5UUJWH5mhLNAR8lq7WGphoaPJ9WCWtONlaT7XfupckbZxpdmizKZxgV/DA9LV9xhXPyYQJwMTZPyRH4zP969eRWVa3Ri6MNCGy81hd6qLBiFmWEFf0Q5Q0dtXizGzpWRm40aPle/Nb0vZrcsG2Oj+OYxFMVlVgql6sjsdNspAP1yQA8CXkToMIWfWyHlhukegdzhPcx0v2sBnPmENHE29g5MDTKEaLNR38lIDwcPXS4zdzyRLVuWfubt1K1cQFPxMw4O6xcPwl15TfHlgWx6LZNhnXxwIIcKgLhaK0GOUt5aSOJDQAypR8/UodtRQw2Zrj6kamGafDPfg/fQbgoZ8ADvekVZk1/J3KsmEcn7i9HocKpCI5dOrt9AoZTePqzvgdYY2gIho0MeUDiVKK2DB/v87tw3TfiawEGL0bXwDax2cVQaogXEQwjsbb23+4fieFD2AP5ulOKQ741HMGkDowwWRzO1Yd2aCFGN1b+YD0EjN0weBwfGC6KVvBpjzvKPJsshXHkvR+0N608hkBdA3WfEpE4HKzzBIiutIa5/LI3nKQw63KwFp+3M+Ow+RHqURzJDRGrYIPrmD+pOo0nex6gBYhloYOmowdnDt3uYAMcv6HJi2S3uA33LkXLKPEpUlnd/KhlQ1yyHi8pS8hRsAXg62Q4nFrbwz6OjuhhFjOZRjW5W8Q=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63981052-7ec6-42eb-14b1-08d7ed743663
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 02:06:08.4264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYj4nXJmLZ0qaK3Scv0yoEBkOwkFJV56uX8G/q2IvhcjSAXeDK5z9Cf23hRny6t+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3447
X-OriginatorOrg: suse.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--mlBc0qm6MnsL2qfir5K0ixhmA1g1kT8qE
Content-Type: multipart/mixed; boundary="6NkkB1vXyRZnfsTtr9T4f6yqEzenPVviz"

--6NkkB1vXyRZnfsTtr9T4f6yqEzenPVviz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 2020/5/1 =E4=B8=8A=E5=8D=889:05, Stephen Rothwell wrote:
> Hi all,
>=20
> On Fri, 1 May 2020 10:24:53 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
>>
>> Today's linux-next merge of the btrfs tree got a conflict in:
>>
>>   fs/btrfs/transaction.c
>>
>> between commit:
>>
>>   fcc99734d1d4 ("btrfs: transaction: Avoid deadlock due to bad initial=
ization timing of fs_info::journal_info")
>>
>> from the btrfs-fixes tree and commit:
>>
>>   f12ca53a6fd6 ("btrfs: force chunk allocation if our global rsv is la=
rger than metadata")
>>
>> from the btrfs tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tr=
ee
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particular=
ly
>> complex conflicts.
>>
>> --=20
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc fs/btrfs/transaction.c
>> index 2d5498136e5e,e4dbd8e3c641..000000000000
>> --- a/fs/btrfs/transaction.c
>> +++ b/fs/btrfs/transaction.c
>> @@@ -666,15 -674,17 +672,26 @@@ got_it
>>   		current->journal_info =3D h;
>>  =20
>>   	/*
>>  +	 * btrfs_record_root_in_trans() needs to alloc new extents, and may=

>>  +	 * call btrfs_join_transaction() while we're also starting a
>>  +	 * transaction.
>>  +	 *
>>  +	 * Thus it need to be called after current->journal_info initialize=
d,
>>  +	 * or we can deadlock.
>>  +	 */
>>  +	btrfs_record_root_in_trans(h, root);
>>  +
>> + 	 * If the space_info is marked ALLOC_FORCE then we'll get upgraded =
to
>> + 	 * ALLOC_FORCE the first run through, and then we won't allocate fo=
r
>> + 	 * anybody else who races in later.  We don't care about the return=

>> + 	 * value here.
>> + 	 */
>> + 	if (do_chunk_alloc && num_bytes) {
>> + 		u64 flags =3D h->block_rsv->space_info->flags;
>> + 		btrfs_chunk_alloc(h, btrfs_get_alloc_profile(fs_info, flags),
>> + 				  CHUNK_ALLOC_NO_FORCE);
>> + 	}
>> +=20
>>   	return h;

The proper fix has landed in David's misc-next branch, which puts
btrfs_record_root_in_trans(); after the if () {} code block.

By that, btrfs_record_root_in_trans() has lesser chance to hit ENOSPC.

Thanks,
Qu

>>  =20
>>   join_fail:
>=20
>=20
> I fixed the missing comment start in my resolution ...
>=20


--6NkkB1vXyRZnfsTtr9T4f6yqEzenPVviz--

--mlBc0qm6MnsL2qfir5K0ixhmA1g1kT8qE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELd9y5aWlW6idqkLhwj2R86El/qgFAl6rhAsACgkQwj2R86El
/qibUQf/dY62XZ6Ehd+ia1Md/nv4LDGJkz8X6n55vwxzwFhw2mdNH8w1zhr+N7Mw
XAlqf7R8yTBQPZPgBi/dyJkvmuQ6Pbkc0Ww0ndL+Dq82UjT7hmqgPvwkz1yWWcqc
VB0gDBI3Kkobw3eRixTHJj0oZnD+5AGL/9HErP3EqW6zE/f6x4pdenbiQzQBhmXl
0fv21kmRIfweLOLrHoxT/3gWYLELC7YRhxtQEQOD56emyvjPoIS8T07Zdc5LPjYu
i/KwyAkQSKl4hq2wch5/9O5LNqwMZUQDJ7Xe8761XUFpqHQtH7kXs3F2EcEiop32
CcdpmAoOw5/e7Hkn/LBZC880Qev+Fw==
=I2LR
-----END PGP SIGNATURE-----

--mlBc0qm6MnsL2qfir5K0ixhmA1g1kT8qE--
