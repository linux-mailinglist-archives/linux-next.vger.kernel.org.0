Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6038CC17
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 08:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfHNGvv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Aug 2019 02:51:51 -0400
Received: from mail-eopbgr720074.outbound.protection.outlook.com ([40.107.72.74]:54432
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726880AbfHNGvv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Aug 2019 02:51:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K08PLPjWW6OUm5IE3OzFDzVB7BICK62hfpC+tNxR4V/voU3XgzSalPXEhwm3f4B8OvcC57RAkLtR6OgSMkUnCnF0FA7+Xl4ormdQUXceay9kTKABIBn4ZDCJ8ESdNZRTzBvLETcPYLRc1baoGvii4R5hRe3t8pXFThE+MhdnVurbX8ew0OQ6XcjNpY7vaepkLzuEiqGV/1gf6LsAuDgCw7e8CbkFAN5XbTl28xLAmS5cXsVj2IoaS5xUiWCsdwU8kOB1+BaHi679Pd7blLv8TZH6gQC3jiKe/nCf3ki1aHF1nZlv2lDrT/QHkIlE/yKz0Rl8d4OBS1dZ8Qf7B6kyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQLbhLpF3pFqnMMVnZ5BzcnSwsoqkvTkvcowJf+JhQ0=;
 b=NI0X+41CwxT375XwMHm/j3UkCNhMNCmhhTjk4YTgJfYjCDolejjrKdohz2m5a8iYWQI2/VdtT427UqLtumoeX+aUlDfRpWk7lqzjL9frEvg7HpRfAHSDiuoDPvwtUD2OKyWKSdlvUDJ07rluWCNBWZzkZ7OlOxtzsdBYZQAWGj1CWN37PCtj/7yH6VpRf6+4rEheF/1LEKOV5T7j7b4YJiQV5pKHpcDmdb9na3dyJnJG79IazqfwvGnnzxxYYUtBN9xI5HjycVjevfjhsqLwnghd+Aie7kqfPTI5PPmvUzW4lrn1AJvo6FS/+ME+WXTPAQABa/4+LyNkT4bfsgJEYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQLbhLpF3pFqnMMVnZ5BzcnSwsoqkvTkvcowJf+JhQ0=;
 b=Bk60yPdEf4z8u+M95MBQAOvTn4QE4Q/6HiuO3h/UhHAAhO8lcaiE2KBackVL74zzsUJzQGQjzwO247zxcpdKgXt2Od0uPlX43DpKUCuko6vpmmUVMJNQpvMit4K3QxT7W40SHvlIgWa3bB3U/s40bDhNoGC4ASgqQYZkBiGZMt8=
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1164.namprd12.prod.outlook.com (10.168.238.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Wed, 14 Aug 2019 06:51:46 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 06:51:46 +0000
From:   "Koenig, Christian" <Christian.Koenig@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        "Kuehling, Felix" <Felix.Kuehling@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with the drm and
 drm-intel trees
Thread-Topic: linux-next: manual merge of the drm-misc tree with the drm and
 drm-intel trees
Thread-Index: AQHVUkugxUnkwyv7mk21q1VjAp+d+6b6NNkA
Date:   Wed, 14 Aug 2019 06:51:46 +0000
Message-ID: <3878b698-e49e-0e62-0db6-2a06bda0c92d@amd.com>
References: <20190814125433.20147fb7@canb.auug.org.au>
In-Reply-To: <20190814125433.20147fb7@canb.auug.org.au>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::26) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b4a8e65-d907-407e-46b7-08d72083df5e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DM5PR12MB1164;
x-ms-traffictypediagnostic: DM5PR12MB1164:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1164FBAC20E59F636D0E686B83AD0@DM5PR12MB1164.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(189003)(199004)(53754006)(8676002)(65806001)(71190400001)(110136005)(99286004)(86362001)(2906002)(54906003)(65956001)(25786009)(31686004)(71200400001)(66574012)(81166006)(81156014)(8936002)(6436002)(229853002)(6246003)(6486002)(6116002)(478600001)(6512007)(31696002)(53936002)(7416002)(14454004)(66556008)(64756008)(7736002)(66446008)(76176011)(2616005)(102836004)(11346002)(186003)(46003)(446003)(6506007)(486006)(316002)(256004)(14444005)(305945005)(58126008)(53546011)(66946007)(65826007)(66476007)(64126003)(386003)(5660300002)(4326008)(52116002)(476003)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1164;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z9EQZBpFgyaoA0m6Zn8g1RaZIRdxqxKx9S+DIArKO9FpVrjWXU0f5NA1jBveXqgs1SmW5CykAgNvrDmtmWzxTuuM5u/jyz6/THmKI+HmL27XMzBxM3n10LAZ/N0nbVWqNbLCOdBET5UWxRsyuy4zkey+od8LcNftlHGi4kQ1fWUg5lQWPktzMRha66AAuN4xaQP9YpI2VzsTPy5vCL+X63uhEZZBANxOu86MC2bvFrMWI+MbZ5AOJW6EFkP9MaoWDvkOwQzmsbSbbzU2pY1rQ7/f3xGklRFTbrqfpX/njnE06Y8JFquVvqRHh/fHW7Wug2UDjVlXb7+sRMRf9jINVpQ0jsF1aSM4sX5vhE6qWJbfkFTGV4IFD8AmbJx+fAX31RYxdlnanNoNvMZhXqsNKHo28TfVPdUiIiO15JrD/cQ=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <653DF9D14AD3B24F85F0C52A2ACA963D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4a8e65-d907-407e-46b7-08d72083df5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 06:51:46.1984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eh9yeXAT+EP0+mEil1rU5+K/dooyutrRH9C3JRtp7UC9FlAxm2FDOZr9No+6eKvo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1164
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Am 14.08.19 um 04:54 schrieb Stephen Rothwell:
> Hi all,
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>
>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>    drivers/gpu/drm/i915/i915_vma.c
>    drivers/gpu/drm/i915/i915_gem_batch_pool.c
>    drivers/gpu/drm/i915/gem/i915_gem_object.c
>    drivers/gpu/drm/i915/gt/intel_engine_pool.c
>
> between commits:
>
>    a93615f900bd ("drm/i915: Throw away the active object retirement compl=
exity")
>    12c255b5dad1 ("drm/i915: Provide an i915_active.acquire callback")
>    cd2a4eaf8c79 ("drm/i915: Report resv_obj allocation failure")
>    b40d73784ffc ("drm/i915: Replace struct_mutex for batch pool serialisa=
tion")
>    ab2f7a5c18b5 ("drm/amdgpu: Implement VRAM wipe on release")
>    0c159ffef628 ("drm/i915/gem: Defer obj->base.resv fini until RCU callb=
ack")
>
> from the drm and drm-intel trees and commit:
>
>    52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
>
> from the drm-misc tree.
>
> I fixed it up (see below and I added the following merge fix patch) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 14 Aug 2019 12:48:39 +1000
> Subject: [PATCH] drm: fix up fallout from "dma-buf: rename reservation_ob=
ject to dma_resv"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Yeah, it was to be expected that this causes a bit trouble.

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 4 ++--
>   drivers/gpu/drm/i915/gem/i915_gem_object.c  | 2 +-
>   drivers/gpu/drm/i915/gt/intel_engine_pool.c | 8 ++++----
>   3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index dfd4aa68c806..6ebe61e14f29 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1242,7 +1242,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_obj=
ect *bo)
>   	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>   		return;
>  =20
> -	reservation_object_lock(bo->base.resv, NULL);
> +	dma_resv_lock(bo->base.resv, NULL);
>  =20
>   	r =3D amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence);
>   	if (!WARN_ON(r)) {
> @@ -1250,7 +1250,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_obj=
ect *bo)
>   		dma_fence_put(fence);
>   	}
>  =20
> -	reservation_object_unlock(bo->base.resv);
> +	dma_resv_unlock(bo->base.resv);
>   }
>  =20
>   /**
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm=
/i915/gem/i915_gem_object.c
> index 3929c3a6b281..67dc61e02c9f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -154,7 +154,7 @@ static void __i915_gem_free_object_rcu(struct rcu_hea=
d *head)
>   		container_of(head, typeof(*obj), rcu);
>   	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
>  =20
> -	reservation_object_fini(&obj->base._resv);
> +	dma_resv_fini(&obj->base._resv);
>   	i915_gem_object_free(obj);
>  =20
>   	GEM_BUG_ON(!atomic_read(&i915->mm.free_count));
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pool.c b/drivers/gpu/dr=
m/i915/gt/intel_engine_pool.c
> index 03d90b49584a..4cd54c569911 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pool.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pool.c
> @@ -43,12 +43,12 @@ static int pool_active(struct i915_active *ref)
>   {
>   	struct intel_engine_pool_node *node =3D
>   		container_of(ref, typeof(*node), active);
> -	struct reservation_object *resv =3D node->obj->base.resv;
> +	struct dma_resv *resv =3D node->obj->base.resv;
>   	int err;
>  =20
> -	if (reservation_object_trylock(resv)) {
> -		reservation_object_add_excl_fence(resv, NULL);
> -		reservation_object_unlock(resv);
> +	if (dma_resv_trylock(resv)) {
> +		dma_resv_add_excl_fence(resv, NULL);
> +		dma_resv_unlock(resv);
>   	}
>  =20
>   	err =3D i915_gem_object_pin_pages(node->obj);

