Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76D4243B26D
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 14:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235959AbhJZMci (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 08:32:38 -0400
Received: from mail-dm3nam07on2057.outbound.protection.outlook.com ([40.107.95.57]:35425
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235947AbhJZMci (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 08:32:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cG7BxtLqONClI20y9iQYh4UbC/yAqVvgrN0vgBWuF8YmOu42Wg/+O/jmmWFnk6G2n+l1/bqlrlgB/NcbRWIs4YI2X9CLeac8zk19X1PY7d4weEQfLnwUb1PqykhkkoeynKdbE82HfvOx5NZGbv96FwWEt5mDo7jn0TI9lUbTO6HpK/RMOI2WKpQPVlJdoskQXzAk887QxvuhsN9OypBXf1bAwwB0VoC3aA5RtY7L1mqoln/7xQjPwd84epJgurfQOjd0f5hqhCbqMjK8T3zaWnw3tavfIsFFLtz5Io2ifg9WnSwNAaddAXNgLjWjWd6rBTBwhvvbQ8wV32fmBuiEmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxGFUJROehdcY9cWwo3Oapm8DPjlGYfJo1zkbiB8dO4=;
 b=CNbNuxX4abVpDYgyMXuwa8x9cIqueYyf5hxKlAeSud7Ue+/PArIhtdIVAv3aZWxEp76iABm6Wuwdcb+//Opw1CMym+I0PUYrXhVvxSANJiWSb72DOEBNxmk72VVcRruOXImJnrFG29o6sxb9VQ1stpNx8EJW/ZFq0qphne00jlmipP5OAAzbAMKqZmm+pla4DOlJewd2/TIql9NoSKcuZAl/GdF2+zFJVTBVRwEZzznujkootSpF5PugelGVDuiv9aF7DscG/QsnS7yLmdcaFbGyVnx3KoCvF2otYa0zsVvdikL7vHkYNipWmNYp4wfAYbwcv6JNWoY8MyvFc4RQCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxGFUJROehdcY9cWwo3Oapm8DPjlGYfJo1zkbiB8dO4=;
 b=XG3GduJEEeL3VIeWc0M/g1AtVAZqvkIdeNIz7GdYy8zYVFIYdrmYLhqs6CqeidA5B9T4hLjIBTJw7rIp7kLMcLr00XsdJk3P6umOzSDbZK1Qp8iWTCZr13fy1ctstqDLDra8JlcsvVW0jMwLGUvvqcJp/7L6lRpqXW4jh85ho0SZ/aar7dIKk4jWojdHVh4balxIX6nQl5KIlnTjwDLra1BXwo3l+mlh/o+V7HmdbKtM6GRnC6nMpGu5FS3ILVm01PN4NshIZl6RD0JOXwBJJG1137SYfhSqXzcMoo/URyjv2ORaIzxZQeJ2ReNeMi1g6CsV0cRB5r8umYohjZbKUw==
Received: from DM5PR12MB2406.namprd12.prod.outlook.com (2603:10b6:4:b7::23) by
 DM5PR12MB1611.namprd12.prod.outlook.com (2603:10b6:4:c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18; Tue, 26 Oct 2021 12:30:12 +0000
Received: from DM5PR12MB2406.namprd12.prod.outlook.com
 ([fe80::5926:d2bb:5b4b:1b99]) by DM5PR12MB2406.namprd12.prod.outlook.com
 ([fe80::5926:d2bb:5b4b:1b99%6]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 12:30:12 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     "Kartik ." <kkartik@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the pinctrl tree
Thread-Topic: linux-next: build failure after merge of the pinctrl tree
Thread-Index: AQHXyipg4QvaXTY5TkqFKpAJpTJi4qvlNhSw
Date:   Tue, 26 Oct 2021 12:30:12 +0000
Message-ID: <DM5PR12MB24064E6B3635CF9EDA7696CBB7849@DM5PR12MB2406.namprd12.prod.outlook.com>
References: <20211026162852.6cf2a2aa@canb.auug.org.au>
In-Reply-To: <20211026162852.6cf2a2aa@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab23179d-d528-4267-48b1-08d9987c5b84
x-ms-traffictypediagnostic: DM5PR12MB1611:
x-microsoft-antispam-prvs: <DM5PR12MB161160A270F835826C6858A3B7849@DM5PR12MB1611.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:298;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zs7eUXyPPCHDpjdlmWy5Ti4j68w9SULf7rHqdtVQ7mZvBoSJ0mKxm2Bq6/6NpoWhVYrUpjAIyuqvkHo/i+mBmf6u5I7Cp/v7mJ+HcmD2RaYTqIg2OyWRHc3+0pGk12yzkuJ154fpZbKTCeAJu1atNm9B3kQxb9/vaEQU9MeemtITlDt/Freix6BoPnz/wFAWxMbUkmCIgRHrggNgXP8r4a/YH6hPaig3n1wmGXyyNMEQv6XJ8W9k3TODCcgyJhuA/ld7BD0Y0AUocqVMSeyiWc2a1Rh8ap3DNCI4zT8GJqymfIbS+Ml+zKzRpW0NUf/QnZU5u7XEtI+jIeHMvmncWcdhNMVYSChH6zeY+4FhfaDapGzFX6kOFIsxdv6VgWHxyIa7GQlByY3L/IC53dXMfyvoKwAj6zPT/DxGD+D7VVATzAbj8ct4u36jswhZc229QrZwL0FBp1PTk5Agbl/ooJ+oUwbIUCikhdRz4sBTwAFly8EkGfSMP9wUnF1YNsVkifZQ0rFfIMUh9s6e7pUSiJtI1qgjQ5mXfe39bFtaJq42Pni2Bqnow4yPyKBQqkBfj0wlWRxkhB6fNXMQ6leWZOjchLSsdznazYDX30HcpDXhUKDECUeiQzZwbVA8wPnccCKTXIKmZS0jBQByCauIhwjjFu3LdW8m+XSdq113m14mZoT5ZpVv2CsSdN4dCoXw0COFNP3zYKKxCiZICFFkFA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2406.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(64756008)(86362001)(186003)(83380400001)(55016002)(54906003)(110136005)(26005)(316002)(71200400001)(508600001)(66446008)(66556008)(53546011)(38070700005)(4326008)(52536014)(122000001)(2906002)(5660300002)(7696005)(33656002)(38100700002)(8676002)(66946007)(99936003)(8936002)(66476007)(76116006)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y7kXlqLfehMTSKsH7+npN01kzhswfNwh2+BMnfU9HWMD/1rTC/2H+FCEW4Vy?=
 =?us-ascii?Q?7DDx+JDR/JXI/2OzES/n0FR969EZhJcjcoRKxm/FqQ9yRWZIMMbU1jMAMNMS?=
 =?us-ascii?Q?/5VvLynOuxRvACUh0ig9AYnDVoGC0KfaU9XRez/pizee3D3mGmAkoOKYZvVT?=
 =?us-ascii?Q?fCVzsHh2ocrw+Kt4DCZgbEwDIkFwckQvI+cFYTABRW+TzAMiJwJpgSiHEkh4?=
 =?us-ascii?Q?5qU1q9ux7kwJH+ZORhpene9prR9T+OP32VSAbJyAdWUt3StILXEKkpSp6z3a?=
 =?us-ascii?Q?4CY4gEv5HHk9Y+lQ+VBvPJe3QrGoTiDgSp9Ihl9dIRx4YfmFHBU4zZULNMUi?=
 =?us-ascii?Q?XG8gWrmhkGrtVGxbvcOqp3YU6zXr8yPqc6ERTqNFYhsm2ZteEFuUYl//vh+s?=
 =?us-ascii?Q?rkHjjqrjPvDYWm0TXvW8raig3YBPMu5UN4Y0LuIO0j+gRXAu7eU/rm+6tBuo?=
 =?us-ascii?Q?CspXovnWz/knopE/cahCePuoh0y2grWm0sqUXfO4qZU1IpOgtt1wk0k21Dtu?=
 =?us-ascii?Q?c6olFN/mwbp1XTKaqerOZ3YZUdr0NKGq3vfTMZ1HEo4R6rV6Pc96KwqkGB+c?=
 =?us-ascii?Q?6Y8Bf4p1swCw1Bwpw12Ezv8tZWdYX4FGmkHACfjdMpo6DS7Od8DkBExOQIrs?=
 =?us-ascii?Q?IsS1ItwXlPwU+GtP4cEL6xr77s26MadBdAaOsEgrv0HeX97Hk8wlstMlcPz5?=
 =?us-ascii?Q?7VUQU0nJc+1Wp8v/6zM1PTS5Q+DJr92W6mRr1W2s+baxibGdGDmsOl9IC78H?=
 =?us-ascii?Q?bJ1epSlB/KZUK1Rfyw6ItW+CTBJXsUDgKFT8pm71Euf0ymt3mjrlTj7pAAAc?=
 =?us-ascii?Q?BUc9s5jHyVbh6Q6167OqE0rIuNFrTQn+yxSkeZo7As5UDYq9F0/0Ff0PEI9C?=
 =?us-ascii?Q?YxYXhLV2kCWItLBmN0N3rLHdRfMApIbgCJery1+/sfb4hgAOsmTi3/hrI3XV?=
 =?us-ascii?Q?sZr9VadS1F3tcbER+RQrbu26wqBWNcevFg5HKIKEgQxNsZDPovaHV8shYvxi?=
 =?us-ascii?Q?kmHQCq8ZKVsasyJwRun90K6/35vJ6Z1E3yTP0NPo021NcTlhXyacsxAm75IT?=
 =?us-ascii?Q?+QdmnD4WgkUvnxKIs8pEAGBHDYE5bRuin7GVAQyDcn4ATZjZElQJw1KKZ2KW?=
 =?us-ascii?Q?X/AiuiVZfKvE+6X0gvz2pAq4FjgW7Z6TI/pLGUONJgs4pGoSvkXsZjK9QF8D?=
 =?us-ascii?Q?X8qUIK+WUcVLYoI0dgjuzXu31eLR/ITB+CK6elgeA8vfccZNNM34u48ArJIG?=
 =?us-ascii?Q?3qMgewWwWCoULqiqYnwbdJ0IDiUR1Z0i+QbddLA8cy8ixJmQjoT+W6RQErdi?=
 =?us-ascii?Q?cWSK1m0wMz2bxWddZyWo1JnTxLXKJQgR9Tw+1nWmVZ4q8cA9lcXymg+vbljC?=
 =?us-ascii?Q?+ItVaC/mmnI+tExBBtn70yOXv1rPk4aCeliR2OMPA1APwMdyJrtJuxaGT7Xr?=
 =?us-ascii?Q?egkez2qzml84uCjhQl33OIql4W1CpIeZBRP5ReNh7xHVuQUKhiwkMGQP9F9e?=
 =?us-ascii?Q?T6P4ckKBHt+1QgxRlzN1jtQCrrKrPHvAP/tf8m6aIU/xzXDO2dxS5TIs5uxE?=
 =?us-ascii?Q?kI+7M9ZYH85RCeOKsa9U5ceLmNauQOvYGzhhcFwH6DeClzcZBvNMh1s1EgFN?=
 =?us-ascii?Q?DQ=3D=3D?=
Content-Type: multipart/mixed;
        boundary="_002_DM5PR12MB24064E6B3635CF9EDA7696CBB7849DM5PR12MB2406namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2406.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab23179d-d528-4267-48b1-08d9987c5b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2021 12:30:12.7588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8/hwbLoHrHNlOqlzlnwZ5EHvkPCwWUdpwdp5H27TdZJySqH2b7ISflM5Nni9l8hGx/2OeepDZoBLJYmqeaDKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1611
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--_002_DM5PR12MB24064E6B3635CF9EDA7696CBB7849DM5PR12MB2406namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Fixed following warnings and error.
Attached the patch that fixes the issue.
Please help apply the Patch.

Thanks
Prathamesh.

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>=20
Sent: Tuesday, October 26, 2021 10:59 AM
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kartik . <kkartik@nvidia.com>; Prathamesh Shete <pshete@nvidia.com>; Li=
nux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux Next Mailing =
List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree

Hi all,

After merging the pinctrl tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pinctrl/tegra/pinctrl-tegra.c: In function 'tegra_pinctrl_get_group=
':
drivers/pinctrl/tegra/pinctrl-tegra.c:293:12: warning: return discards 'con=
st' qualifier from pointer target type [-Wdiscarded-qualifiers]
  293 |     return &pmx->soc->groups[group];
      |            ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/tegra/pinctrl-tegra.c:282:25: warning: unused variable 'g' =
[-Wunused-variable]
  282 |  struct tegra_pingroup *g;
      |                         ^
drivers/pinctrl/tegra/pinctrl-tegra.c: In function 'tegra_pinctrl_gpio_disa=
ble_free':
drivers/pinctrl/tegra/pinctrl-tegra.c:341:10: error: 'return' with a value,=
 in function returning void [-Werror=3Dreturn-type]
  341 |   return -EINVAL;
      |          ^
drivers/pinctrl/tegra/pinctrl-tegra.c:327:13: note: declared here
  327 | static void tegra_pinctrl_gpio_disable_free(struct pinctrl_dev *pct=
ldev,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  a42c7d95d29e ("pinctrl: tegra: Use correct offset for pin group")

I have used the pinctrl tree from next-20211025 for today.
--=20
Cheers,
Stephen Rothwell

--_002_DM5PR12MB24064E6B3635CF9EDA7696CBB7849DM5PR12MB2406namp_
Content-Type: application/octet-stream;
	name="0001-pinctrl-tegra-Fix-warnings-and-error.patch"
Content-Description: 0001-pinctrl-tegra-Fix-warnings-and-error.patch
Content-Disposition: attachment;
	filename="0001-pinctrl-tegra-Fix-warnings-and-error.patch"; size=1541;
	creation-date="Tue, 26 Oct 2021 12:19:32 GMT";
	modification-date="Tue, 26 Oct 2021 12:17:52 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkNDBjMDliZmQwNDE1YjU3ZTEwMmIxYmUzODE4YjAyYTJkMTA4MGE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQcmF0aGFtZXNoIFNoZXRlIDxwc2hldGVAbnZpZGlhLmNvbT4K
RGF0ZTogVHVlLCAyNiBPY3QgMjAyMSAxNzo0MTozNSArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIHBp
bmN0cmw6IHRlZ3JhOiBGaXggd2FybmluZ3MgYW5kIGVycm9yCgpGaXggd2FybmluZ3MgYXJlIGVy
cm9ycyBjYXVzZWQgYnkgY29tbWl0IGE0MmM3ZDk1ZDI5ZQooInBpbmN0cmw6IHRlZ3JhOiBVc2Ug
Y29ycmVjdCBvZmZzZXQgZm9yIHBpbiBncm91cCIpLgoKU2lnbmVkLW9mZi1ieTogUHJhdGhhbWVz
aCBTaGV0ZSA8cHNoZXRlQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9waW5jdHJsL3RlZ3JhL3Bp
bmN0cmwtdGVncmEuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3RlZ3JhL3BpbmN0
cmwtdGVncmEuYyBiL2RyaXZlcnMvcGluY3RybC90ZWdyYS9waW5jdHJsLXRlZ3JhLmMKaW5kZXgg
MDQ3MWQ5YzdmMGJhLi44ZDczNGJmYzMzZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGluY3RybC90
ZWdyYS9waW5jdHJsLXRlZ3JhLmMKKysrIGIvZHJpdmVycy9waW5jdHJsL3RlZ3JhL3BpbmN0cmwt
dGVncmEuYwpAQCAtMjc5LDcgKzI3OSw2IEBAIHN0YXRpYyBzdHJ1Y3QgdGVncmFfcGluZ3JvdXAg
KnRlZ3JhX3BpbmN0cmxfZ2V0X2dyb3VwKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRlCiAJCQkJ
CXVuc2lnbmVkIGludCBvZmZzZXQpCiB7CiAJc3RydWN0IHRlZ3JhX3BteCAqcG14ID0gcGluY3Ry
bF9kZXZfZ2V0X2RydmRhdGEocGN0bGRldik7Ci0Jc3RydWN0IHRlZ3JhX3Bpbmdyb3VwICpnOwog
CXVuc2lnbmVkIGludCBncm91cCwgbnVtX3BpbnMsIGo7CiAJY29uc3QgdW5zaWduZWQgaW50ICpw
aW5zOwogCWludCByZXQ7CkBAIC0yOTAsNyArMjg5LDcgQEAgc3RhdGljIHN0cnVjdCB0ZWdyYV9w
aW5ncm91cCAqdGVncmFfcGluY3RybF9nZXRfZ3JvdXAoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3Rs
ZGUKIAkJCWNvbnRpbnVlOwogCQlmb3IgKGogPSAwOyBqIDwgbnVtX3BpbnM7IGorKykgewogCQkJ
aWYgKG9mZnNldCA9PSBwaW5zW2pdKQotCQkJCXJldHVybiAmcG14LT5zb2MtPmdyb3Vwc1tncm91
cF07CisJCQkJcmV0dXJuIChzdHJ1Y3QgdGVncmFfcGluZ3JvdXAgKikmcG14LT5zb2MtPmdyb3Vw
c1tncm91cF07CiAJCX0KIAl9CiAKQEAgLTMzOCw3ICszMzcsNyBAQCBzdGF0aWMgdm9pZCB0ZWdy
YV9waW5jdHJsX2dwaW9fZGlzYWJsZV9mcmVlKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwK
IAlncm91cCA9IHRlZ3JhX3BpbmN0cmxfZ2V0X2dyb3VwKHBjdGxkZXYsIG9mZnNldCk7CiAKIAlp
ZiAoIWdyb3VwKQotCQlyZXR1cm4gLUVJTlZBTDsKKwkJcmV0dXJuOwogCiAJaWYgKGdyb3VwLT5t
dXhfcmVnIDwgMCB8fCBncm91cC0+c2ZzZWxfYml0IDwgMCkKIAkJcmV0dXJuOwotLSAKMi4xNy4x
Cgo=

--_002_DM5PR12MB24064E6B3635CF9EDA7696CBB7849DM5PR12MB2406namp_--
