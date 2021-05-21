Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A7C38C8C8
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 15:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235925AbhEUN4a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 May 2021 09:56:30 -0400
Received: from mail-sn1anam02on2063.outbound.protection.outlook.com ([40.107.96.63]:24971
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236349AbhEUN42 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 May 2021 09:56:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYrTptHIXSs1BHeZG7SAfHnDvpvb+wNSpfPKueZsPNAnAQoevtkoatO5hGufoseMVQuHbMw4IOZLTKFEeLWZsM+wpw6g4HA3Y+C0fDpRRdT97HwitudY+sulSy9LBYHntzzNxGSDDy2WZFVhLH3Z9SG5p2h0m4PS2/Xp454m7pps7HYrc13yxnX6tmkl6KRS+mHgJgk7S3WH9Fbmq015TyDXMSqdKAzJjzJHjMf/VB07qw278hV6HRkdJ2EUmYCl7Ur3pP2SVD8R95TqMmdH+6N1j73EQ8syK49MjpnmZ4VXXwGlDRvU8UK0Fg7Vnsul67H0mfrx9U7zRAenN5TH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lQw5oRgemSmaXrvMupixIUV8BWJZW6UTSQkiHjACSw=;
 b=LQDonC5vQxVGyqNrKhXsEQW0EqQod64gqHkOb9iYTxXYqqxiG63u1VMT9txdABl66QtLkbLhl8Kch0ir7pyRxBz2R+q9alZadLovf01NIAJ5JweHMLlxEgOOxY9FCiGctbsuxUyUk3qNcb5YP1Ypfzur800yqzrSH7pV2Tu+STTUIuqjur9ge2SwVvH6tGgdMDECDBaptu2U0nmoiUqZY//dtN60oDwPlpd+nhqo0R+iAHow5PS0VoZWmel2dSBT0OAnyZ4t3X1/KaTEzA23CIJ6uemPwOdS9ZESJizX5sh1SBA9QtZcasg70nA2fByg8tkB6N9V39bvgKH14BtxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netapp.com; dmarc=pass action=none header.from=netapp.com;
 dkim=pass header.d=netapp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lQw5oRgemSmaXrvMupixIUV8BWJZW6UTSQkiHjACSw=;
 b=cQdL1JrQMBhSbYZ8nGn4w0NE2TWuiIefwfQccBRNsGJ4dNaQl6Uw9F9bedp0OAYWzvQf+/quyhmJgrBsoiBf64wUAryFsxGDl/ViDzgVdkFu1ss1L7zLtVtmdaoy6TxwjkgOR0GweUrGCa4eettBKDni1QugPxvHpHXRFKqlzP9BTl6ASIefdQYeXOZy/o2sNG9RV5tE1JcqUwDqlkZcLYDmrHHHWbVZgoiE+7hKvToluWvUcmEmzlqnuM2K30Ms3nIxaEcwYA/PJbCDnHACNDL8A7RDkk3g2J7KIgc0WFGYwEGfFKi17ENX0XSjmjz82ayPG/9sTWs6Y6q07suTtA==
Received: from DM6PR06MB4074.namprd06.prod.outlook.com (2603:10b6:5:86::20) by
 DM5PR06MB2908.namprd06.prod.outlook.com (2603:10b6:3:11f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Fri, 21 May 2021 13:55:03 +0000
Received: from DM6PR06MB4074.namprd06.prod.outlook.com
 ([fe80::ad2b:6b24:5d5e:187d]) by DM6PR06MB4074.namprd06.prod.outlook.com
 ([fe80::ad2b:6b24:5d5e:187d%7]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 13:55:03 +0000
From:   "Kornievskaia, Olga" <Olga.Kornievskaia@netapp.com>
To:     "J. Bruce Fields" <bfields@fieldses.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfsd tree
Thread-Topic: linux-next: Signed-off-by missing for commit in the nfsd tree
Thread-Index: AQHXTcQZoMQDW/AiX0i5ARtfemJmaKrt9RaA//++H4A=
Date:   Fri, 21 May 2021 13:55:03 +0000
Message-ID: <EC2C4D09-8C52-4DDE-B21F-311219237DE4@netapp.com>
References: <20210521080416.45f06cb8@canb.auug.org.au>
 <20210521135051.GA30314@fieldses.org>
In-Reply-To: <20210521135051.GA30314@fieldses.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.48.21041102
authentication-results: fieldses.org; dkim=none (message not signed)
 header.d=none;fieldses.org; dmarc=none action=none header.from=netapp.com;
x-originating-ip: [2600:1700:6a10:2e90:7c7a:2baa:ca17:c448]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81a1025d-ac76-4ac0-30ef-08d91c6008be
x-ms-traffictypediagnostic: DM5PR06MB2908:
x-microsoft-antispam-prvs: <DM5PR06MB29084974351504DFD53CD5EE93299@DM5PR06MB2908.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dlHyPHqAIj0ueSLvHHDUW7Y4Sdp6Bf3Ev+KlA+JjDeL3cYUO15lFKN1TqMbvxD3DVcpHabGcfkJLi8VbIbpT+vJywuso09NNEeuDN1hK/V/3xqmyl+1uzq7gpLygKruhclzcdeg5i1Sbd3GXkCB0KxTUxDuxFr/uoFInUeIHE4rlXKN/FNxfmk1F+wcVOFGVxGfdL+CoT85x+aUcZznycN+5n3Wf1V+Pgh3enNINfzHh2IPyxPgeOaKJv+R41Xb7UQIdVej3A519wU2kvRMmdOB8Si0fc4Gn5BPziQvr+us6zZII3OTrajhLZ9i8nwm1vwt0UXt48W4h+yOZsBryanfxIKJlX1TyeuOCuhSlAWmxq+pfO3CSTudI0gWCV1bvLY7Epemnp/02cMYgMkEy1cdLs+0mGmL7qTDq8i4/XFI29A3VqSpZ4s69eyJ6YARuxF21WzuOmJNjFxFyPhsgj3Uk1QHKxJLc0N4DMS26/hXj90GBxgPFyFT63tEGL5VUM7cwQ4U0faINTji19BEgCZq2UI2jDs0wmRy9r41w+nyVLtbfH20QeCRw95fAkwceS/9hDH01m4KsVpwgTuInHifJYymM2A7QaSamWrHOPoab/9hWlQSn7Slr3FcfNv1w+0TFJuu3QdQkj9khi8oPOT7QfmLTFbZ+0nWoPWFKhDw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR06MB4074.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(36756003)(8936002)(5660300002)(4744005)(8676002)(122000001)(66446008)(38100700002)(6506007)(64756008)(91956017)(76116006)(66556008)(2906002)(71200400001)(86362001)(66476007)(66946007)(4326008)(2616005)(110136005)(478600001)(6512007)(316002)(186003)(83380400001)(6486002)(33656002)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TlNmWDVVcWdGRHUzRVU5ckpsNGlpRktBbjk0WmhhS3FZY3RkMVR1R1N6eFdx?=
 =?utf-8?B?RFFpN1RiK2VOaVN6VGY1WENkN1BYZUQrbmthV0IrYTZiZHNoenpDNWxMYTNv?=
 =?utf-8?B?UGtBY0JWMmhyTmRITHdXVjBocXM0L1FuQkNuSVM3cHo1cVp4U2FCRXpTU21F?=
 =?utf-8?B?ZmVOVnUvOGZaOGZxTkxwMTY4T3JoMkUxbGJkZzdtWXI2K1BQelh2QUFMZk4w?=
 =?utf-8?B?QW12S0FUczhtUHpieFBUd3hmTmNvcHVtM081MGxFYVEzYlNnZS8wZFJrSU0v?=
 =?utf-8?B?Rjd1elJyY09RVkNwYzRnVTBFd21Wem5SN3hwS3lqL1U3Z0xDZDA0UU9lTkNH?=
 =?utf-8?B?K2NhU1A1WC9DYmVoaFJOZVJacy8wbzRaZWlIMm14N1F2QVVVVW81dE54NW4z?=
 =?utf-8?B?U1YxdHREdWwyVFlyb3VoZ2VKVzRLUi9YUkxRdVNBMExDU3ZSeEVOWVFCNEVM?=
 =?utf-8?B?L1NoR00zSUM0TTl6UVBHQjJmU2VqaDliK2NVK0hLc3owWS8wR3NCcXBrdis0?=
 =?utf-8?B?aFlmS09wMytLUWtCQmhBVXVFSzBLRWE0eVNsd1NuN0xNTHQwUTZWSHAwTjRT?=
 =?utf-8?B?QTRzSDRPR2tpM3JSbTFHSmxyS0x4am00eUI3UzkrbHdLRHo4NFBkQkhtbHoy?=
 =?utf-8?B?ZFl1dVV4RXhDalU3MGJrTVFXWi8vTklySDJDeWUrVDV6aWJTemFHVDNYbllK?=
 =?utf-8?B?b2NtZ0plVzNrRVVGWVZhTGJFanA3cFFYODRONlFlbzF0ajV6VWV5UmpJRkxl?=
 =?utf-8?B?WGRTQU9XdmJNakhuSzNyWVYwcE91ejZMN2ZHM2RHMVd0ek1kRlIwQWRsRGpN?=
 =?utf-8?B?dk12bmRuZ29uOE1TVE9sTEpOemZPRnpjNnNQQ3MzWUxVT0JCSkpiMG05OVA2?=
 =?utf-8?B?d3liMjV5eElabXRScDVzTy9QaU5VeG5JTzZIY3RDNzRJOTZobHBLWU5tKzRq?=
 =?utf-8?B?MTdlWE9xb1Q1YXV3YS82ekRnc1FuRmhrbEFaZlhpNEFyUTY3dFVDS2VZNHhh?=
 =?utf-8?B?bWtjQVJYdW1BVHdGb05UUzg1OVBqdVU2TTVKbWMxbHN5UENwYThwVVRnTkwy?=
 =?utf-8?B?RTE4ZzEzSmVWbDcxRjdxMmpLU0hhZnJ5dm1vbGgwclQya2ZERzNnQ2lGZnpx?=
 =?utf-8?B?bmlBRXZHaUNHMENCTW9wMitoTXFOZXBNY2FsV3dqV3J3YlZHQnZWUzU5WTFm?=
 =?utf-8?B?QTU0UHBTSUh0TGdCSGE5cHRDVzBKdE1yQWFpeWhMV0VIU0NoWlhIOTRPNDhv?=
 =?utf-8?B?aWcwZDRaZjRQL1d3elo3OVNPNytpVDlEQnorblZpcHR5TzZxY0Nib0dMRHNZ?=
 =?utf-8?B?eFlIWmFPTmV4dUF3VkYwT2F1SG4zWkhNQ2lQcjBSbStZeDFNVnVBQmprMXhh?=
 =?utf-8?B?eFV0QnRVTFM4TjJqRHpJU3lEK3NQRnZDc3JicnVLWFl5UzAzU0RFYUZGSitq?=
 =?utf-8?B?N0tyeThMcmREcFlXVXJvb3RqUElONit5QjdqSDBzY1gxTE9vRTNDeDhxY2FO?=
 =?utf-8?B?SnlXdVRMcWZwY0tDS1JIQWdtSitBNVd6eGY4MnZYNFRwdFhrdWdlMUs3N0g2?=
 =?utf-8?B?Y2hqR0dOZUt5cXNPWDR6VlZMN21DOVZoQkFRNFY2UGlobm1GWmJBclVCcDFa?=
 =?utf-8?B?R1JoNVpVN1RxL1NqNGp3bXJBK2RsaFVNOWszQUJRNjA3dm55VFlvSU9QWW5N?=
 =?utf-8?B?dm50RDM0aU5uZmp5VVlSeURTa0duNkwrM2N3MCtrOEt6ZldMdE8zNlFlOWlR?=
 =?utf-8?B?ZUd4UU1lRnlKN3YranF1azZrMFo5VHVVVTNSOStnckRWOFNDKzhUSmtrUzFs?=
 =?utf-8?B?NkcwMTRGUVo4N0tYdTNqZGFGTjE1L092em1VQzZjcG5vZ1ZVUDUzM2J6U3dE?=
 =?utf-8?B?UXJxSXUzWFdibXg3QTRnVU5SbGFodko1aHNhRmxMWk9uY3c9PQ==?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <278340C68876664DA7B073E169B6670C@namprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR06MB4074.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a1025d-ac76-4ac0-30ef-08d91c6008be
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 13:55:03.7366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xgo0DHk9zMib11jyZ5fnYe61MvLlk25a2zH0Lpp7Astlj61Xq32cY2qT21oHeqwqGl3MpEge4dwGdgBicwQcAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR06MB2908
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

DQoNCu+7v09uIDUvMjEvMjEsIDk6NTEgQU0sICJKLiBCcnVjZSBGaWVsZHMiIDxiZmllbGRzQGZp
ZWxkc2VzLm9yZz4gd3JvdGU6DQoNCiAgICBOZXRBcHAgU2VjdXJpdHkgV0FSTklORzogVGhpcyBp
cyBhbiBleHRlcm5hbCBlbWFpbC4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBp
cyBzYWZlLg0KDQoNCg0KDQogICAgT24gRnJpLCBNYXkgMjEsIDIwMjEgYXQgMDg6MDQ6MTZBTSAr
MTAwMCwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToNCiAgICA+IEhpIGFsbCwNCiAgICA+DQogICAg
PiBDb21taXQNCiAgICA+DQogICAgPiAgIGZmNzhiOTQ0MjkyNiAoIk5GU0QgYWRkIHZmc19mc3lu
YyBhZnRlciBhc3luYyBjb3B5IGlzIGRvbmUiKQ0KICAgID4NCiAgICA+IGlzIG1pc3NpbmcgYSBT
aWduZWQtb2ZmLWJ5IGZyb20gaXRzIGF1dGhvci4NCg0KICAgIE9sZ2EsIGNhbiBJIGFkZA0KDQog
ICAgICAgICAgICBTaWduZWQtb2ZmLWJ5OiBPbGdhIEtvcm5pZXZza2FpYSA8a29sZ2FAbmV0YXBw
LmNvbT4NCg0KICAgID8NCg0KW29sZ2FdIEJ1dCB0aGUgcG9zdC9wYXRjaCBjb250YWlucyB0aGF0
PyBJIGRvbuKAmXQgdW5kZXJzdGFuZC4gRXZlbiBhdHRhY2hlZCBmaWxlIGhhcyBpdC4gSSB0aGlu
ayB3aGF0IHRyaXBzIHRoZXNlIHN5c3RlbSBpcyB0aGF0IEkgdXNlIGdtYWlsIHRvIHN1Ym1pdCBw
YXRjaGVzIGJ1dCBzaWduZWQtb2ZmLWJ5IGlzIGZyb20gbXkgbmV0YXBwIGVtYWlsLiBVbmZvcnR1
bmF0ZWx5LCBJIGhhdmUgbm8gd2F5IG9mIHN1Ym1pdHRpbmcgdGhlbSBmcm9tIG5ldGFwcC4gU28g
dGhlIHBhdGNoIGlzIGNvcnJlY3QgdGhlIGF1dG9tYXRlZCBzeXN0ZW0gaXMgbGV0J3Mgc2F5IGlz
ICJ0b28gc3RyaWN0Ij8NCg0KICAgIC0tYi4NCg0K
