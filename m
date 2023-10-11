Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 200B77C487F
	for <lists+linux-next@lfdr.de>; Wed, 11 Oct 2023 05:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344988AbjJKDie (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Oct 2023 23:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344976AbjJKDid (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Oct 2023 23:38:33 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A5E94
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 20:38:31 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7a26fbfcf8eso253934739f.2
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 20:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696995511; x=1697600311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imld9lSRibJTHi2O41N/z4mncQIodrX8WldrREhzpWA=;
        b=euMO46nMdaBKn6EJDF1eI3knacoQvTZaQZiFV0RQbs0t2PUJbXocUoHSjVK3n1Mp6a
         6EpZM9oo/N76MjV14hdxMgDYtMKrLeZKe+Ra0N7tZ8LbV84PbAfx6B93O8R61LYxIQ3P
         fpghhWZgs7BqU+6/TzV2YQ7KMyj3uANzkM1sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696995511; x=1697600311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imld9lSRibJTHi2O41N/z4mncQIodrX8WldrREhzpWA=;
        b=aBWW9evU9U1sfuF7UDYhiovR/aOuJcHmoIB1tgmMrhhLXBCKVt3ibtSyZ9dlDHX3/C
         D9kYk9VKml5oomgji1VlGN0LD+XFSzh7yqf6XEYsXdV8Z52LoqwqlYy9FtXNtsCSr0ls
         aWuU8yxpPS3dgodEFyPo39VV83hCNrkEtWJy4z9e7PG/IXPZe6VrVh4KzoE1gmDQuvcn
         xOtL7eqxMWQP9QdeoxCJG10DKZBTcDdioPGL2uvynf8k4eCnlhBz+DGqd4Bj2bmvOSmF
         njftxs4GIDP/hAglUHMFHBrlbADcJiIKgNwzAobkCYgUnTYaeQWuwh7GY/BzEgAU9d0y
         3ZJw==
X-Gm-Message-State: AOJu0YwR+7+wHTicBQpz+IIKlqyA6Vqp04yl9dLR7lGmTLpqNyBOcMb8
        SKGjqWMr1ZiC7AXjBiLqrUk0dAJmQD5Ezq+DD1iGWA==
X-Google-Smtp-Source: AGHT+IEQJANlYnpRI5mWyApAybfmTY2AK/dF6/OqPQ7Cgkquti/+AKD7grpaB6z90zoSmq57/7Uhkysc+17fYJ9NBKY=
X-Received: by 2002:a5e:8810:0:b0:799:2163:418a with SMTP id
 l16-20020a5e8810000000b007992163418amr22170134ioj.13.1696995510737; Tue, 10
 Oct 2023 20:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231010123345.12bfda28@canb.auug.org.au>
In-Reply-To: <20231010123345.12bfda28@canb.auug.org.au>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 10 Oct 2023 20:38:19 -0700
Message-ID: <CAJs_Fx63s+m2umccuq29pmec8S8y59WtaoQbhk4QVLJARy9P5A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-msm tree with the mm, drm trees
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@redhat.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hey Dave,

lmk how you want me to handle this to make it easier for you when I
send my pull request for 6.7.. I can merge drm-next to take care of
*that* conflict (either before I send my PR or push it somewhere where
you can see the resolution) but not sure about the mm conflict since
pulling that might get me ahead of drm-next.  Either way, Stephen's
resolution looks correct.

BR,
-R

On Mon, Oct 9, 2023 at 6:33=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> FIXME: Add owner of second tree to To:
>        Add author(s)/SOB of conflicting commits.
>
> Today's linux-next merge of the drm-msm tree got conflicts in:
>
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>   drivers/gpu/drm/msm/msm_drv.c
>
> between commits:
>
>   01790d5e372f ("drm/msm: Convert to platform remove callback returning v=
oid")
>   cd61a76c210a ("drm/msm: dynamically allocate the drm-msm_gem shrinker")
>
> from the mm, drm trees and commits:
>
>   283add3e6405 ("drm/msm: remove shutdown callback from msm_platform_driv=
er")
>   506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")
>
> from the drm-msm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 82381d12414d,d14ae316796c..000000000000
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@@ -1299,12 -1230,72 +1230,70 @@@ static int dpu_kms_init(struct drm_dev=
i
>
>   static int dpu_dev_probe(struct platform_device *pdev)
>   {
> -       return msm_drv_probe(&pdev->dev, dpu_kms_init);
> +       struct device *dev =3D &pdev->dev;
> +       struct dpu_kms *dpu_kms;
> +       int irq;
> +       int ret =3D 0;
> +
> +       dpu_kms =3D devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
> +       if (!dpu_kms)
> +               return -ENOMEM;
> +
> +       dpu_kms->pdev =3D pdev;
> +
> +       ret =3D devm_pm_opp_set_clkname(dev, "core");
> +       if (ret)
> +               return ret;
> +       /* OPP table is optional */
> +       ret =3D devm_pm_opp_of_add_table(dev);
> +       if (ret && ret !=3D -ENODEV)
> +               return dev_err_probe(dev, ret, "invalid OPP table in devi=
ce tree\n");
> +
> +       ret =3D devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "failed to parse clocks\n"=
);
> +
> +       dpu_kms->num_clocks =3D ret;
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return dev_err_probe(dev, irq, "failed to get irq\n");
> +
> +       dpu_kms->base.irq =3D irq;
> +
> +       dpu_kms->mmio =3D msm_ioremap(pdev, "mdp");
> +       if (IS_ERR(dpu_kms->mmio)) {
> +               ret =3D PTR_ERR(dpu_kms->mmio);
> +               DPU_ERROR("mdp register memory map failed: %d\n", ret);
> +               dpu_kms->mmio =3D NULL;
> +               return ret;
> +       }
> +       DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
> +
> +       dpu_kms->vbif[VBIF_RT] =3D msm_ioremap(pdev, "vbif");
> +       if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
> +               ret =3D PTR_ERR(dpu_kms->vbif[VBIF_RT]);
> +               DPU_ERROR("vbif register memory map failed: %d\n", ret);
> +               dpu_kms->vbif[VBIF_RT] =3D NULL;
> +               return ret;
> +       }
> +
> +       dpu_kms->vbif[VBIF_NRT] =3D msm_ioremap_quiet(pdev, "vbif_nrt");
> +       if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
> +               dpu_kms->vbif[VBIF_NRT] =3D NULL;
> +               DPU_DEBUG("VBIF NRT is not defined");
> +       }
> +
> +       ret =3D dpu_kms_parse_data_bus_icc_path(dpu_kms);
> +       if (ret)
> +               return ret;
> +
> +       return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
>   }
>
>  -static int dpu_dev_remove(struct platform_device *pdev)
>  +static void dpu_dev_remove(struct platform_device *pdev)
>   {
>         component_master_del(&pdev->dev, &msm_drm_ops);
>  -
>  -      return 0;
>   }
>
>   static int __maybe_unused dpu_runtime_suspend(struct device *dev)
> @@@ -1380,8 -1371,8 +1369,8 @@@ MODULE_DEVICE_TABLE(of, dpu_dt_match)
>
>   static struct platform_driver dpu_driver =3D {
>         .probe =3D dpu_dev_probe,
>  -      .remove =3D dpu_dev_remove,
>  +      .remove_new =3D dpu_dev_remove,
> -       .shutdown =3D msm_drv_shutdown,
> +       .shutdown =3D msm_kms_shutdown,
>         .driver =3D {
>                 .name =3D "msm_dpu",
>                 .of_match_table =3D dpu_dt_match,
> diff --cc drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index e5012fa6771f,982b7689e5b6..000000000000
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@@ -557,12 -507,60 +507,58 @@@ static const struct dev_pm_ops mdp4_pm_
>
>   static int mdp4_probe(struct platform_device *pdev)
>   {
> -       return msm_drv_probe(&pdev->dev, mdp4_kms_init);
> +       struct device *dev =3D &pdev->dev;
> +       struct mdp4_kms *mdp4_kms;
> +       int irq;
> +
> +       mdp4_kms =3D devm_kzalloc(dev, sizeof(*mdp4_kms), GFP_KERNEL);
> +       if (!mdp4_kms)
> +               return dev_err_probe(dev, -ENOMEM, "failed to allocate km=
s\n");
> +
> +       mdp4_kms->mmio =3D msm_ioremap(pdev, NULL);
> +       if (IS_ERR(mdp4_kms->mmio))
> +               return PTR_ERR(mdp4_kms->mmio);
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return dev_err_probe(dev, irq, "failed to get irq\n");
> +
> +       mdp4_kms->base.base.irq =3D irq;
> +
> +       /* NOTE: driver for this regulator still missing upstream.. use
> +        * _get_exclusive() and ignore the error if it does not exist
> +        * (and hope that the bootloader left it on for us)
> +        */
> +       mdp4_kms->vdd =3D devm_regulator_get_exclusive(&pdev->dev, "vdd")=
;
> +       if (IS_ERR(mdp4_kms->vdd))
> +               mdp4_kms->vdd =3D NULL;
> +
> +       mdp4_kms->clk =3D devm_clk_get(&pdev->dev, "core_clk");
> +       if (IS_ERR(mdp4_kms->clk))
> +               return dev_err_probe(dev, PTR_ERR(mdp4_kms->clk), "failed=
 to get core_clk\n");
> +
> +       mdp4_kms->pclk =3D devm_clk_get(&pdev->dev, "iface_clk");
> +       if (IS_ERR(mdp4_kms->pclk))
> +               mdp4_kms->pclk =3D NULL;
> +
> +       mdp4_kms->axi_clk =3D devm_clk_get(&pdev->dev, "bus_clk");
> +       if (IS_ERR(mdp4_kms->axi_clk))
> +               return dev_err_probe(dev, PTR_ERR(mdp4_kms->axi_clk), "fa=
iled to get axi_clk\n");
> +
> +       /*
> +        * This is required for revn >=3D 2. Handle errors here and let t=
he kms
> +        * init bail out if the clock is not provided.
> +        */
> +       mdp4_kms->lut_clk =3D devm_clk_get_optional(&pdev->dev, "lut_clk"=
);
> +       if (IS_ERR(mdp4_kms->lut_clk))
> +               return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "fa=
iled to get lut_clk\n");
> +
> +       return msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.b=
ase);
>   }
>
>  -static int mdp4_remove(struct platform_device *pdev)
>  +static void mdp4_remove(struct platform_device *pdev)
>   {
>         component_master_del(&pdev->dev, &msm_drm_ops);
>  -
>  -      return 0;
>   }
>
>   static const struct of_device_id mdp4_dt_match[] =3D {
> @@@ -573,8 -571,8 +569,8 @@@ MODULE_DEVICE_TABLE(of, mdp4_dt_match)
>
>   static struct platform_driver mdp4_platform_driver =3D {
>         .probe      =3D mdp4_probe,
>  -      .remove     =3D mdp4_remove,
>  +      .remove_new =3D mdp4_remove,
> -       .shutdown   =3D msm_drv_shutdown,
> +       .shutdown   =3D msm_kms_shutdown,
>         .driver     =3D {
>                 .name   =3D "mdp4",
>                 .of_match_table =3D mdp4_dt_match,
> diff --cc drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 8a7b44376bc6,a28fbcd09684..000000000000
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@@ -939,10 -894,43 +894,43 @@@ static int mdp5_dev_probe(struct platfo
>         if (ret)
>                 return ret;
>
> -       return msm_drv_probe(&pdev->dev, mdp5_kms_init);
> +       mdp5_kms->pdev =3D pdev;
> +
> +       spin_lock_init(&mdp5_kms->resource_lock);
> +
> +       mdp5_kms->mmio =3D msm_ioremap(pdev, "mdp_phys");
> +       if (IS_ERR(mdp5_kms->mmio))
> +               return PTR_ERR(mdp5_kms->mmio);
> +
> +       /* mandatory clocks: */
> +       ret =3D get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
> +       if (ret)
> +               return ret;
> +       ret =3D get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
> +       if (ret)
> +               return ret;
> +       ret =3D get_clk(pdev, &mdp5_kms->core_clk, "core", true);
> +       if (ret)
> +               return ret;
> +       ret =3D get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
> +       if (ret)
> +               return ret;
> +
> +       /* optional clocks: */
> +       get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
> +       get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
> +       get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return dev_err_probe(&pdev->dev, irq, "failed to get irq\=
n");
> +
> +       mdp5_kms->base.base.irq =3D irq;
> +
> +       return msm_drv_probe(&pdev->dev, mdp5_kms_init, &mdp5_kms->base.b=
ase);
>   }
>
>  -static int mdp5_dev_remove(struct platform_device *pdev)
>  +static void mdp5_dev_remove(struct platform_device *pdev)
>   {
>         DBG("");
>         component_master_del(&pdev->dev, &msm_drm_ops);
> @@@ -986,8 -975,8 +974,8 @@@ MODULE_DEVICE_TABLE(of, mdp5_dt_match)
>
>   static struct platform_driver mdp5_driver =3D {
>         .probe =3D mdp5_dev_probe,
>  -      .remove =3D mdp5_dev_remove,
>  +      .remove_new =3D mdp5_dev_remove,
> -       .shutdown =3D msm_drv_shutdown,
> +       .shutdown =3D msm_kms_shutdown,
>         .driver =3D {
>                 .name =3D "msm_mdp",
>                 .of_match_table =3D mdp5_dt_match,
> diff --cc drivers/gpu/drm/msm/msm_drv.c
> index 05fe32c3a4b4,401e9ef86074..000000000000
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@@ -457,23 -264,12 +264,14 @@@ static int msm_drm_init(struct device *
>         if (ret)
>                 goto err_deinit_vram;
>
> -       /* the fw fb could be anywhere in memory */
> -       ret =3D drm_aperture_remove_framebuffers(drv);
> -       if (ret)
> -               goto err_msm_uninit;
> -
>  -      msm_gem_shrinker_init(ddev);
>  +      ret =3D msm_gem_shrinker_init(ddev);
>  +      if (ret)
>  +              goto err_msm_uninit;
>
>         if (priv->kms_init) {
> -               ret =3D priv->kms_init(ddev);
> -               if (ret) {
> -                       DRM_DEV_ERROR(dev, "failed to load kms\n");
> -                       priv->kms =3D NULL;
> +               ret =3D msm_drm_kms_init(dev, drv);
> +               if (ret)
>                         goto err_msm_uninit;
> -               }
> -               kms =3D priv->kms;
>         } else {
>                 /* valid only for the dummy headless case, where of_node=
=3DNULL */
>                 WARN_ON(dev->of_node);
> @@@ -1277,37 -971,21 +973,19 @@@ int msm_drv_probe(struct device *master
>
>   static int msm_pdev_probe(struct platform_device *pdev)
>   {
> -       return msm_drv_probe(&pdev->dev, NULL);
> +       return msm_drv_probe(&pdev->dev, NULL, NULL);
>   }
>
>  -static int msm_pdev_remove(struct platform_device *pdev)
>  +static void msm_pdev_remove(struct platform_device *pdev)
>   {
>         component_master_del(&pdev->dev, &msm_drm_ops);
>  -
>  -      return 0;
>   }
>
> - void msm_drv_shutdown(struct platform_device *pdev)
> - {
> -       struct msm_drm_private *priv =3D platform_get_drvdata(pdev);
> -       struct drm_device *drm =3D priv ? priv->dev : NULL;
> -
> -       /*
> -        * Shutdown the hw if we're far enough along where things might b=
e on.
> -        * If we run this too early, we'll end up panicking in any variet=
y of
> -        * places. Since we don't register the drm device until late in
> -        * msm_drm_init, drm_dev->registered is used as an indicator that=
 the
> -        * shutdown will be successful.
> -        */
> -       if (drm && drm->registered && priv->kms)
> -               drm_atomic_helper_shutdown(drm);
> - }
> -
>   static struct platform_driver msm_platform_driver =3D {
>         .probe      =3D msm_pdev_probe,
>  -      .remove     =3D msm_pdev_remove,
>  +      .remove_new =3D msm_pdev_remove,
> -       .shutdown   =3D msm_drv_shutdown,
>         .driver     =3D {
>                 .name   =3D "msm",
> -               .pm     =3D &msm_pm_ops,
>         },
>   };
>
