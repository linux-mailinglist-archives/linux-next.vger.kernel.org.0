Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49671435D97
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 11:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhJUJJV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 05:09:21 -0400
Received: from mail-dm6nam08on2083.outbound.protection.outlook.com ([40.107.102.83]:50177
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230440AbhJUJJU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Oct 2021 05:09:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoxmQ8SoXiGuWW3XxNv9AY4hUVw2JqxtB+DdRedqKF0S2s2fSzgQ1imCbVQQHvfW61O5er3BZhA0wyo0G+fmrflqjNhpDBCbcioGaDoabkmDgmJoULlSbVqWDa+wIsynnzFDRQ4cZ97DKVRJMhpqK/2ti/cfCvybInF5nBZmrGJBaL8LJpFdz1sXd/zaaqtNwW04ChNJ86eaPOVCi3KaoEJ47c0EgXtlquRG04x4oawyEHJy0N0XAhIGrLwrFTYEckMuQkj8UJvi9Ntral8NZp6Il0Y4J9oVwK6iaJn5cEUL+wA8CaXoPhcryQP8QIEn3EQ9ceRhv1UwOHxCsZsdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtxoEHsH44+THyc/VV3MpRHQRC/Oz+okPi7xBiENXd0=;
 b=B8bKaT0pV6BKAKW7ge+GOGpLNF/pUOP5LS48EyD+5/Tgk/8UjCwQCN3A0NppJlrDRsJ4MnyLOyoba+j/1z+zIZ5JYzVoi5L9//9oj9QIYrvecDv8I2gbbDaK7/WXvyPXNtF9ciMA+TLdXDhjYSZSsNys96EvvnCofpDLs3cUMPff4Tz1iFiKhg31cNWDuglZrvplzrgCmUOjDQSFfGCY1i4u2lGID7UbA2qos2sDsG4VredEtoucKBf+qIlysqftQaBn0L46aVhmRxZVY8fTYFPWXZWo/hH8tXnRYPD2LV3LllpOhhbQJSVbFZgILnQu3YjAjckRgCZyaTl8Ai/eSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtxoEHsH44+THyc/VV3MpRHQRC/Oz+okPi7xBiENXd0=;
 b=AhEyvS0pzSzVYmBLuK0kSm2epUtsQFTsY5PwTGjYNmDDMu6HqfvTyyxcQaTsseFwmtlH8WXRtouOnpSUkk7v/Nkcyb+b7PtRJ6TO+HmaIwE2JJ2FzA4z8oIGRfytNjjh1+FLfb3KTHmqAtFHJ5XDP0oAA8Zwof01tEvlfePie3eX9ET+DUBrPf/jmaRzDX79b/xHaAiA94KGUYLGrx16VCKIR8Kl58CweFhaoPjjfw5k+ClnnsD94kcICd4nxakX2tLLFIPDy7AVuYIbHImS5CRjhYe/H3groOkKwPDKVQzQhWc0rvS4o1XYXg0TSMo0Ae2ifZszFHCST7N5lUfNJA==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by BN9PR12MB5365.namprd12.prod.outlook.com (2603:10b6:408:102::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Thu, 21 Oct
 2021 09:07:03 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::f846:3ab1:9cc3:ee1]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::f846:3ab1:9cc3:ee1%7]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 09:07:03 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warnings after merge of the drivers-x86 tree
Thread-Topic: linux-next: build warnings after merge of the drivers-x86 tree
Thread-Index: AQHXxk/tUu18LybahU6SygVXiBoT3qvdKHKA
Date:   Thu, 21 Oct 2021 09:07:03 +0000
Message-ID: <BN9PR12MB53814D3DCD5BD5E9441DE3F3AFBF9@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <20211021184735.794b22a7@canb.auug.org.au>
In-Reply-To: <20211021184735.794b22a7@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95386047-6fbb-4e7d-e36b-08d99472262b
x-ms-traffictypediagnostic: BN9PR12MB5365:
x-microsoft-antispam-prvs: <BN9PR12MB5365D64D4E557B62676ABE1FAFBF9@BN9PR12MB5365.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:339;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FVtnHEVd8ktOtGsM0YJROmVkXM/o+gXy3SUI6AbeILHn2Xh/SmDxu0H1hOrMj+8bIY3vtzJj0uUsl9rg47s9+c6BqeDRttPSnC4RIFc7pvDriBRt41DjjhaaPi8Z5Y/ZszBPqVFu3eADf8K6j/qztGXR3blZhF0lW7/xFIJqCoFEFAxHAgzy6UUx4kHZWm3b3RbY+0kqcZVymkYXJgSfmanGk0NTRq6EEVUdP+ZHg0q7Mjd2BlFqqt0JkUxqDm/LYoonyH+M45kX4qX8kIiUI6ricEWijX5BB4GLaJ2Tc/srWdnff9wh0ZpfZkecbNByaCSiIadHePeVUwzbBJv+uAZ9DsZ1+bcxXW6OlxElDoIFMPS556ykOWevw7HYW651XHXCBTyYfvBftW0cMzEjiKN5UVmd72w36Y1ZjQNKKaVRrVaZN9L5GRKagTiwo5pWGxTIOeObeIv8zFj8NCHz/8wD7bxKSlOMglh0B/J8zoHTAf33Hb3V7sO/xpOJRgblyRo5q+uMRyZ3hpB09ra1PN3aihPU/E7bC/DeXRoS7GcJTHKFqwHxa6399B8f9sEf7fPsuXQO6GWqtAXCEcmgfsjSFMFllGt9dxroAQFIAdfh7dXlnaGZQr6MIbUkXQndInuwwuuV6COaKYKfqCrW7u4/hj2aLZt8oYc9YB7PMdWaIHAxUB9d54P+W0NqCqsa+QLZ1rmr6hjPF9bCsCiU7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(33656002)(4326008)(54906003)(316002)(7696005)(9686003)(8936002)(86362001)(5660300002)(38070700005)(55016002)(8676002)(53546011)(76116006)(66476007)(52536014)(64756008)(66446008)(83380400001)(186003)(110136005)(122000001)(38100700002)(66556008)(66946007)(71200400001)(508600001)(6506007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QQbrnrsMP3GzpkN1zpjfy1XWYh4D9ETVEs28N4DHo7kFS+fTu84iLkLxJIRq?=
 =?us-ascii?Q?iJCzdEohLgG9to010Gq775piHzxS+gjx+GIdFymAooxk2DzXuE0sBRInnScJ?=
 =?us-ascii?Q?XMrumssc3qdSvusWo3FHvCDITqh6LMUmx9tKS3NTT30QO0ph2gf6XlM1ewW+?=
 =?us-ascii?Q?rbYHGqieJB+LW10Mv/jjjzgtiXHVWfPh30BQtKCQpjSJ+2ba9GvShwCFxm2m?=
 =?us-ascii?Q?DRqykIxn+PCaeV/vGlOVlP964Q3xWUVf8wor5CDjG0dKN8pbmIqPXm/pCxkZ?=
 =?us-ascii?Q?51N1qJ/PHnfiqhcG/sGbZjzAusGdfpgksiTPF0/b9E0zAfwr1+Lr+PASFDuN?=
 =?us-ascii?Q?kOkmQkpXP17L/OugLSzrPl2wcWUArsq8O4HdglNVUON+3mAnk5D0a1NQm4mw?=
 =?us-ascii?Q?cEdc/syYTu9XCJc7+JPbR4mb1QqsDb7QLmyLhLlgFO0VfRCOeMwmtrJGKCYV?=
 =?us-ascii?Q?2Md5LwW1pmhDoGMETLQxsss7DADjTscf/xAbthVS5zDCi10Ds/HWESPUI6Pl?=
 =?us-ascii?Q?cG7xhI6uqaooUsw0nCQVOcxt8r2la3WxPNkJMaQWeOKWx/SUDLvNo1gHUN4I?=
 =?us-ascii?Q?kgc/RSEPGj7HDikevNtyhzWDSKBNMv97oYTKx+ZhbuZK0WWdICRnrtcWQVay?=
 =?us-ascii?Q?t7UvhN0rgfTMOHKF5YZv4KnwI10FrCJAorsjNln9otyx4NhrrvnkRJOfWIKz?=
 =?us-ascii?Q?FY4jUSjEpHIK0OKu4SlhLUvauXUMG4EESE+D9+tyqJzxUS1u9im2IdnncErk?=
 =?us-ascii?Q?ey4neYEPYPBIaeEFYX+T67go4UNrdX1gNtzf9O/E6MIOdXGrhXpNj6Qo7mPk?=
 =?us-ascii?Q?pmV4pxAeFZ4TuVCa8SYLf6xr235lPxhWGFZ8taaYTOifEYpyyFChgnOfwwj5?=
 =?us-ascii?Q?pq/hHjTyyr6nKCBbjJYVlURYtFeTXW3YPexvRaV5WfIQYJ+8ytcD+l56Ryd0?=
 =?us-ascii?Q?7Kqy3WD99eLuxfSTyfXVpB5vjuLX0M+gkhxALRlDjR1g7GjLxjLTFTAEURv6?=
 =?us-ascii?Q?s5jJJ+DbIEAeDfe9s1sLwQqI23N+ecMu01eZRPr7DxChffXoTkZ0yStXhTWh?=
 =?us-ascii?Q?NuyFJJrlWMXbkTsNuYTp4Te5f6duTK0an5GujHLF0l9LCgwRWpzyQIZIZNP7?=
 =?us-ascii?Q?VeJGHyxvnsc7cNnMUntpvM0LoCJsJAktD1LF+qQAYBHDRz73eIBdolli9MO3?=
 =?us-ascii?Q?AM8dunGtOvEPCTvHWmD8rZ35W/bQAEOND4jikZ44QMN3if/3tp4aagvPfSfp?=
 =?us-ascii?Q?Cxz9cCJzsqRMAeN7firPszWp3yHmZmPZmhkOhOffyP30VoGydadcvZs+BoDS?=
 =?us-ascii?Q?Zr24x+H6hsjc6hIjAERRTmEFQdFfAOthZT27u0FUE48XYnlbDL44EhwO9wYT?=
 =?us-ascii?Q?UmcljLSvJrktGSe2c/srwkX1NJc8GI2C+jaHpQQDMzLY/VYchl39d8PepOdy?=
 =?us-ascii?Q?cPYBokaSw40=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95386047-6fbb-4e7d-e36b-08d99472262b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 09:07:03.5745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vadimp@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5365
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Thursday, October 21, 2021 10:48 AM
> To: Hans de Goede <hdegoede@redhat.com>; Mark Gross
> <markgross@kernel.org>
> Cc: Vadim Pasternak <vadimp@nvidia.com>; Linux Kernel Mailing List <linux=
-
> kernel@vger.kernel.org>; Linux Next Mailing List <linux-
> next@vger.kernel.org>
> Subject: linux-next: build warnings after merge of the drivers-x86 tree
>=20
> Hi all,
>=20
> After merging the drivers-x86 tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING:
> Unexpected indentation.
> Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING: Block
> quote ends without a blank line; unexpected unindent.

Hi,

What is wrong with the syntax at line 230 and where blank line is expected?

What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_active_ima=
ge
What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_auth_fail
What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_upgrade_fa=
il
Date:		October 2021	<--- this is line 230
KernelVersion:	5.16

Thanks,
Vadim.

>=20
> Introduced by commit
>=20
>   527cd54d49dd ("Documentation/ABI: Add new attributes for mlxreg-io sysf=
s
> interfaces")
>=20
> --
> Cheers,
> Stephen Rothwell
