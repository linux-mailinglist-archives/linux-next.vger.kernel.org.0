Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2BC229A40
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 16:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbgGVOj3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 10:39:29 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:29186 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgGVOj2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 10:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1595428767; x=1626964767;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=8HvsVF6+6vfOPXqFtm5mDRHc/7xydWxhkCej4weMdbU=;
  b=DExJSLC/feBZHVvYmMf/IQ5vv22I5u8egQMZtFf+jkeYRQd0qGKKfrw8
   lZx+W5MIMyyeeeC6R8m9kywQ6HuD2IH45+whP9f6rVWOxeBKfldRKowhA
   RGYnoEqWZqAf0gf+xtNOh0cbcdkUfWQS6+Gpc0PeEqzPPB5yQcOQ+WMRS
   8FiRfiaqS0tBnTJ9KBWzBRYhC9N1NuxMIBgTAvKWugoCoruida4l+8+hC
   8Ymze+MZrhPtJY4B6JpDv2fY0WVh8xhEwnOpeX9Rts+tq5x/2EVDWkF4F
   l0vpDJ/zgPiuVAqThTtUZFshTsBlZhNGYydnh4nZzvsJir987l8K8xzhX
   Q==;
IronPort-SDR: RDd7MM6gLecCa0p2WHq6KBOYlxNxT6lWNqIx6sbfFOvDheAAkEUiYfP31so+TEivea/VfC+sjf
 p/ZB35g8wiyMbtbqEV6iayBfYXSPmgZ1923azt7xCIF5+l4WVMDduCqhKVjLfQGmPFUfwdgE86
 O4AO3sweyxdFXTH3ikMlcE3E/SKrK271tjE5DzULVtRL53kM4E+dhyb7qPX90y48EzLEziKksD
 96T4KlHCCCB8HjAcClbIKMBlEX7kXWJFqzHNseYkpslAsA+o/eow3nZ8N3EWN04pfQBgr80BsE
 7qw=
X-IronPort-AV: E=Sophos;i="5.75,383,1589212800"; 
   d="scan'208";a="144383943"
Received: from mail-co1nam04lp2050.outbound.protection.outlook.com (HELO NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.50])
  by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 22:39:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNMOCqWqC2bUa6a6o+Ru+JI4zVuqS7CvNfbfBJ3JysODUWYPz94CJ7oq+mi5LMO5KR3qL/zRaoUp+ez3HktaEK1e+taUX1xTsR8JhjsPAwtRRZD/F7LFsrtrrPI4DSfk72WkopA4sx5JxBKqPlYEdlqkjs+2s/VpZhwvnw7oVniy3RH41Wwc+Qn8vPGogjsXHYoVeJDDYq0gZh7B/T5TRM72TF9j7lpLwPBz4+Gp+Bpk2OgY8YB/5BDcTee7tiYhD0EdjnPLk1RbgjXAyhj/1BnkU4uAPtO5iv0lywA6Z/SY9prbVnRWw8qCBBC8bj2okz2gjFGCtDdva2ANpKp7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCHEmqhzb7gHUPZ+LF5xSdaGXNCQv/HgPToYC3NfKPQ=;
 b=OijvJ+fE64lsu389pfkdi318nIJsY+YlDFSC0PCTCDbVdhHWk7b9AIjk5TBC8CImYs/B5HTkZFSJSLQCMtgEHfpKPPDGdJsyJ0IbCCWkhz+FbSbINuAkINvpzn/JXlOJX7/iHSCQONeMhyoH4azU9cr8Pt4RNoof99tXzyyy2zouQ9YgTuiikUjN5UWHJF7b7F6RDQMARnUElzlz3C90IuKJeCWUNOv3PcXChW4tmHR2OgmnZ7/lDgMNSptRvluzPYWpQ2f2HP4kL4gwwIzvSafCN3zSGeNfisTyAkPHT/ooL5KMcHkq7E4hbtEipS7RqpPpuXWTuNbp8mkU6fXzYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCHEmqhzb7gHUPZ+LF5xSdaGXNCQv/HgPToYC3NfKPQ=;
 b=o6mcNi+RcpfVl/pEoiKrd7IW6tPKZXZr+q5dB1/EW8OGUUJ1g8xezRJmGxj6nKCXVMv/krJtKkXWgv3NDulUR2cuWmBBv7xMJzpe3Z6ZB1aE8X6t/F4xuJPEy2xm3thkH9HIS7J0+SRKMSr5SZWafBzInyp1LrPMRDH+kvZAG14=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0566.namprd04.prod.outlook.com (2603:10b6:903:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Wed, 22 Jul
 2020 14:39:24 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025; Wed, 22 Jul 2020
 14:39:24 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: interesting merge in the zonefs tree
Thread-Topic: linux-next: interesting merge in the zonefs tree
Thread-Index: AQHWYDAlawvQHwkQg0uu/iK03AzjUg==
Date:   Wed, 22 Jul 2020 14:39:24 +0000
Message-ID: <CY4PR04MB37519AA66C3B84BDF00C658CE7790@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200722235802.1f01457e@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 84daa2b2-b68f-4e93-1922-08d82e4d0746
x-ms-traffictypediagnostic: CY4PR04MB0566:
x-microsoft-antispam-prvs: <CY4PR04MB0566953C0C654A5B49E676BAE7790@CY4PR04MB0566.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NfH5SoKVs+LtN3rhoAdqZwg9XvXnu2GvqHOVpwTlNCm6sXLAJdr6yIu/mF+tDXGzujFv6czdcODtH8wy9zlk8jhD+xVMz90tq1+vXHY2ZUqVHitU6LzRWtJi3mu8LsZiD6lAFASeTSf+CxMPRvxuxQWQ2RVBuTp9lxIuIj+wTJ4qMGyy9i24sSiKFaQUbiWMGHgxXLAwnImk8T9C0DscThzhp1zUDONjDEDCh3diEN+SVwHfVM/dg5lghw7XtdxAkcQVBbQ/ihJ8RMC0nxQFDOY+rPCAbtPeOgl20ObpW2eiygu3C2rNqwYUpvZ7jIqU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR04MB3751.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(66946007)(66446008)(66556008)(64756008)(66476007)(8936002)(76116006)(7696005)(71200400001)(91956017)(2906002)(8676002)(4744005)(186003)(54906003)(86362001)(26005)(316002)(6506007)(53546011)(9686003)(478600001)(55016002)(5660300002)(6916009)(52536014)(4326008)(83380400001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: M+ZwrpyJV9Bb5Fa3GE8B7LHBZD51MowddqZt9ciuEseLdezNJDoFA09IL3gt+rFpzewDFrIwkoqXABYt+GI10qB/l2N5/iSyHjfct8NuGG1SBTcfrdOh4AwjZjqFH0lwYH25VmfZgyJsa8thdV4znd5jLqNBbSG9mj5AAJOtwfN6w30oix7efaezU42dMgtGk000IEAmCnM8vcj/Qp4Z/lO2nJ6aDWxVSWvbHeXy9AhAgSSZJ0b9Qx+KKo19ADrQNLP/J8bMh22lqeOpusd2M0CYYaK0zYgp1jIsWNXRsuLy7G958LuDeQEwiIgwV+NCT2eJdF2ue3jorsSmLJ6xv8fO9hIPn+kDrhJ9zFoWzrbcuXvmC0+ROY2HPRfjhrXIDXson+rLmj9VJcqGi0Rg0GVshykQvpm9h0q9MlnB3hR3fpkjweAM6Rve1NPXaNNObDJLlEkyGrONdFgCZzoDPePxE4qczFleg6KjKf6nPMsKmmD+ZiIX8FCgcWsp5pYv
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84daa2b2-b68f-4e93-1922-08d82e4d0746
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 14:39:24.1449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4R6+ZJg6MSDE9rft0GGZvOMoCGY3QlyDL7c6bktmkwrKfE1DMObs04ENUW1Qk60J59yKhgN/NeEagVzsavA5yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0566
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020/07/22 22:58, Stephen Rothwell wrote:=0A=
> Hi all,=0A=
> =0A=
> It looks an old version of the block tree has been merged into the=0A=
> zonefs tree.  Is that deliberate?  Other trees should not be merged unles=
s=0A=
> they are guaranteed not to be rebased (which is what has happened here).=
=0A=
> =0A=
=0A=
I rebuild zonefs for-5.9 branch: 5.8-rc6 base + Jens block tree for-5.9/dri=
vers=0A=
branch merged on top (not rebased). zonefs for-next branch is now identical=
 to=0A=
that. Please let me know if there is still a problem.=0A=
=0A=
Thanks !=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
