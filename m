Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8524E282D7F
	for <lists+linux-next@lfdr.de>; Sun,  4 Oct 2020 22:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgJDULi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 4 Oct 2020 16:11:38 -0400
Received: from crapouillou.net ([89.234.176.41]:41958 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726288AbgJDULi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 4 Oct 2020 16:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1601842295; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8uNbZF6G0SrqlSpNN26WUSWcI2O/a4jWMAh43vVSA/s=;
        b=evVtgvASK3vozZDyFXTt/I+9JZqA46E7GO+XXWHXBTqKZrMCT56JjRupeb+s1KJKnIWbd/
        8zeXObYL/9wKgVCUVB8Dh6HyqFKvtQMg8BXnkLQ9HIbMH1bAfNliZ/3HomPK0d2sg8mLLj
        uPM95iVxRA+l2/pC4SeV4mgBDWJuwDI=
Date:   Sun, 04 Oct 2020 22:11:23 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM
 =?UTF-8?Q?buffers=0D=0A?= cached"
To:     Sam Ravnborg <sam@ravnborg.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>, Dave Airlie <airlied@linux.ie>,
        od@zcrc.me, DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-Id: <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
In-Reply-To: <20201004195921.GA556605@ravnborg.org>
References: <20200930165212.GA8833@lst.de>
        <20201004141758.1013317-1-paul@crapouillou.net>
        <20201004195921.GA556605@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Le dim. 4 oct. 2020 =E0 21:59, Sam Ravnborg <sam@ravnborg.org> a =E9crit :
> Hi Paul.
>=20
> On Sun, Oct 04, 2020 at 04:17:58PM +0200, Paul Cercueil wrote:
>>  This reverts commit 37054fc81443cc6a8c3a38395f384412b8373d82.
>=20
> In the changelog please refer to commits like this:
> 37054fc81443 ("gpu/drm: ingenic: Add option to mmap GEM buffers=20
> cached")
>=20
> Use "dim cite 37054fc81443cc6a8c3a38395f384412b8373d82" to get the=20
> right format.
>=20
>>=20
>>  At the very moment this commit was created, the DMA API it relied=20
>> on was
>>  modified in the DMA tree, which caused the driver to break in
>>  linux-next.
>>=20
>>  Revert it for now, and it will be resubmitted later to work with=20
>> the new
>>  DMA API.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>=20
> With the changelog updated:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Pushed to drm-misc-next with the changelog fix, thanks.

Stephen:
Now it should build fine again. Could you remove the BROKEN flag?

Cheers,
-Paul

>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 114=20
>> +---------------------
>>   drivers/gpu/drm/ingenic/ingenic-drm.h     |   4 -
>>   drivers/gpu/drm/ingenic/ingenic-ipu.c     |  12 +--
>>   3 files changed, 4 insertions(+), 126 deletions(-)
>>=20
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index 0225dc1f5eb8..7d8b0ad52979 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -9,8 +9,6 @@
>>   #include <linux/component.h>
>>   #include <linux/clk.h>
>>   #include <linux/dma-mapping.h>
>>  -#include <linux/dma-noncoherent.h>
>>  -#include <linux/io.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/of_device.h>
>>  @@ -24,7 +22,6 @@
>>   #include <drm/drm_color_mgmt.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_crtc_helper.h>
>>  -#include <drm/drm_damage_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_gem_cma_helper.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>  @@ -100,11 +97,6 @@ struct ingenic_drm {
>>   	struct notifier_block clock_nb;
>>   };
>>=20
>>  -static bool ingenic_drm_cached_gem_buf;
>>  -module_param_named(cached_gem_buffers, ingenic_drm_cached_gem_buf,=20
>> bool, 0400);
>>  -MODULE_PARM_DESC(cached_gem_buffers,
>>  -		 "Enable fully cached GEM buffers [default=3Dfalse]");
>>  -
>>   static bool ingenic_drm_writeable_reg(struct device *dev, unsigned=20
>> int reg)
>>   {
>>   	switch (reg) {
>>  @@ -402,8 +394,6 @@ static int=20
>> ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>>   	     plane->state->fb->format->format !=3D=20
>> state->fb->format->format))
>>   		crtc_state->mode_changed =3D true;
>>=20
>>  -	drm_atomic_helper_check_plane_damage(state->state, state);
>>  -
>>   	return 0;
>>   }
>>=20
>>  @@ -521,38 +511,6 @@ void ingenic_drm_plane_config(struct device=20
>> *dev,
>>   	}
>>   }
>>=20
>>  -void ingenic_drm_sync_data(struct device *dev,
>>  -			   struct drm_plane_state *old_state,
>>  -			   struct drm_plane_state *state)
>>  -{
>>  -	const struct drm_format_info *finfo =3D state->fb->format;
>>  -	struct ingenic_drm *priv =3D dev_get_drvdata(dev);
>>  -	struct drm_atomic_helper_damage_iter iter;
>>  -	unsigned int offset, i;
>>  -	struct drm_rect clip;
>>  -	dma_addr_t paddr;
>>  -	void *addr;
>>  -
>>  -	if (!ingenic_drm_cached_gem_buf)
>>  -		return;
>>  -
>>  -	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
>>  -
>>  -	drm_atomic_for_each_plane_damage(&iter, &clip) {
>>  -		for (i =3D 0; i < finfo->num_planes; i++) {
>>  -			paddr =3D drm_fb_cma_get_gem_addr(state->fb, state, i);
>>  -			addr =3D phys_to_virt(paddr);
>>  -
>>  -			/* Ignore x1/x2 values, invalidate complete lines */
>>  -			offset =3D clip.y1 * state->fb->pitches[i];
>>  -
>>  -			dma_cache_sync(priv->dev, addr + offset,
>>  -				       (clip.y2 - clip.y1) * state->fb->pitches[i],
>>  -				       DMA_TO_DEVICE);
>>  -		}
>>  -	}
>>  -}
>>  -
>>   static void ingenic_drm_update_palette(struct ingenic_drm *priv,
>>   				       const struct drm_color_lut *lut)
>>   {
>>  @@ -581,8 +539,6 @@ static void=20
>> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>   	if (state && state->fb) {
>>   		crtc_state =3D state->crtc->state;
>>=20
>>  -		ingenic_drm_sync_data(priv->dev, oldstate, state);
>>  -
>>   		addr =3D drm_fb_cma_get_gem_addr(state->fb, state, 0);
>>   		width =3D state->src_w >> 16;
>>   		height =3D state->src_h >> 16;
>>  @@ -752,69 +708,7 @@ static void ingenic_drm_disable_vblank(struct=20
>> drm_crtc *crtc)
>>   	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,=20
>> JZ_LCD_CTRL_EOF_IRQ, 0);
>>   }
>>=20
>>  -static struct drm_framebuffer *
>>  -ingenic_drm_gem_fb_create(struct drm_device *dev, struct drm_file=20
>> *file,
>>  -			  const struct drm_mode_fb_cmd2 *mode_cmd)
>>  -{
>>  -	if (ingenic_drm_cached_gem_buf)
>>  -		return drm_gem_fb_create_with_dirty(dev, file, mode_cmd);
>>  -
>>  -	return drm_gem_fb_create(dev, file, mode_cmd);
>>  -}
>>  -
>>  -static int ingenic_drm_gem_mmap(struct drm_gem_object *obj,
>>  -				struct vm_area_struct *vma)
>>  -{
>>  -	struct drm_gem_cma_object *cma_obj =3D to_drm_gem_cma_obj(obj);
>>  -	struct device *dev =3D cma_obj->base.dev->dev;
>>  -	unsigned long attrs;
>>  -	int ret;
>>  -
>>  -	if (ingenic_drm_cached_gem_buf)
>>  -		attrs =3D DMA_ATTR_NON_CONSISTENT;
>>  -	else
>>  -		attrs =3D DMA_ATTR_WRITE_COMBINE;
>>  -
>>  -	/*
>>  -	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and=20
>> set the
>>  -	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want=20
>> to map
>>  -	 * the whole buffer.
>>  -	 */
>>  -	vma->vm_flags &=3D ~VM_PFNMAP;
>>  -	vma->vm_pgoff =3D 0;
>>  -	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>>  -
>>  -	ret =3D dma_mmap_attrs(dev, vma, cma_obj->vaddr, cma_obj->paddr,
>>  -			     vma->vm_end - vma->vm_start, attrs);
>>  -	if (ret)
>>  -		drm_gem_vm_close(vma);
>>  -
>>  -	return ret;
>>  -}
>>  -
>>  -static int ingenic_drm_gem_cma_mmap(struct file *filp,
>>  -				    struct vm_area_struct *vma)
>>  -{
>>  -	int ret;
>>  -
>>  -	ret =3D drm_gem_mmap(filp, vma);
>>  -	if (ret)
>>  -		return ret;
>>  -
>>  -	return ingenic_drm_gem_mmap(vma->vm_private_data, vma);
>>  -}
>>  -
>>  -static const struct file_operations ingenic_drm_fops =3D {
>>  -	.owner		=3D THIS_MODULE,
>>  -	.open		=3D drm_open,
>>  -	.release	=3D drm_release,
>>  -	.unlocked_ioctl	=3D drm_ioctl,
>>  -	.compat_ioctl	=3D drm_compat_ioctl,
>>  -	.poll		=3D drm_poll,
>>  -	.read		=3D drm_read,
>>  -	.llseek		=3D noop_llseek,
>>  -	.mmap		=3D ingenic_drm_gem_cma_mmap,
>>  -};
>>  +DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
>>=20
>>   static struct drm_driver ingenic_drm_driver_data =3D {
>>   	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>>  @@ -878,7 +772,7 @@ static const struct drm_encoder_helper_funcs=20
>> ingenic_drm_encoder_helper_funcs =3D
>>   };
>>=20
>>   static const struct drm_mode_config_funcs=20
>> ingenic_drm_mode_config_funcs =3D {
>>  -	.fb_create		=3D ingenic_drm_gem_fb_create,
>>  +	.fb_create		=3D drm_gem_fb_create,
>>   	.output_poll_changed	=3D drm_fb_helper_output_poll_changed,
>>   	.atomic_check		=3D drm_atomic_helper_check,
>>   	.atomic_commit		=3D drm_atomic_helper_commit,
>>  @@ -1032,8 +926,6 @@ static int ingenic_drm_bind(struct device=20
>> *dev, bool has_components)
>>   		return ret;
>>   	}
>>=20
>>  -	drm_plane_enable_fb_damage_clips(&priv->f1);
>>  -
>>   	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
>>=20
>>   	ret =3D drm_crtc_init_with_planes(drm, &priv->crtc, &priv->f1,
>>  @@ -1062,8 +954,6 @@ static int ingenic_drm_bind(struct device=20
>> *dev, bool has_components)
>>   			return ret;
>>   		}
>>=20
>>  -		drm_plane_enable_fb_damage_clips(&priv->f0);
>>  -
>>   		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_components) {
>>   			ret =3D component_bind_all(dev, drm);
>>   			if (ret) {
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h=20
>> b/drivers/gpu/drm/ingenic/ingenic-drm.h
>>  index ee3a892c0383..9b48ce02803d 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm.h
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
>>  @@ -171,10 +171,6 @@ void ingenic_drm_plane_config(struct device=20
>> *dev,
>>   			      struct drm_plane *plane, u32 fourcc);
>>   void ingenic_drm_plane_disable(struct device *dev, struct=20
>> drm_plane *plane);
>>=20
>>  -void ingenic_drm_sync_data(struct device *dev,
>>  -			   struct drm_plane_state *old_state,
>>  -			   struct drm_plane_state *state);
>>  -
>>   extern struct platform_driver *ingenic_ipu_driver_ptr;
>>=20
>>   #endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
>>  index 38c83e8cc6a5..fc8c6e970ee3 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
>>  @@ -20,7 +20,6 @@
>>=20
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>  -#include <drm/drm_damage_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>>  @@ -317,8 +316,6 @@ static void=20
>> ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>>   				JZ_IPU_CTRL_CHIP_EN | JZ_IPU_CTRL_LCDC_SEL);
>>   	}
>>=20
>>  -	ingenic_drm_sync_data(ipu->master, oldstate, state);
>>  -
>>   	/* New addresses will be committed in vblank handler... */
>>   	ipu->addr_y =3D drm_fb_cma_get_gem_addr(state->fb, state, 0);
>>   	if (finfo->num_planes > 1)
>>  @@ -537,7 +534,7 @@ static int=20
>> ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>>=20
>>   	if (!state->crtc ||
>>   	    !crtc_state->mode.hdisplay || !crtc_state->mode.vdisplay)
>>  -		goto out_check_damage;
>>  +		return 0;
>>=20
>>   	/* Plane must be fully visible */
>>   	if (state->crtc_x < 0 || state->crtc_y < 0 ||
>>  @@ -554,7 +551,7 @@ static int=20
>> ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>>   		return -EINVAL;
>>=20
>>   	if (!osd_changed(state, plane->state))
>>  -		goto out_check_damage;
>>  +		return 0;
>>=20
>>   	crtc_state->mode_changed =3D true;
>>=20
>>  @@ -581,9 +578,6 @@ static int=20
>> ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>>   	ipu->denom_w =3D denom_w;
>>   	ipu->denom_h =3D denom_h;
>>=20
>>  -out_check_damage:
>>  -	drm_atomic_helper_check_plane_damage(state->state, state);
>>  -
>>   	return 0;
>>   }
>>=20
>>  @@ -765,8 +759,6 @@ static int ingenic_ipu_bind(struct device *dev,=20
>> struct device *master, void *d)
>>   		return err;
>>   	}
>>=20
>>  -	drm_plane_enable_fb_damage_clips(plane);
>>  -
>>   	/*
>>   	 * Sharpness settings range is [0,32]
>>   	 * 0       : nearest-neighbor
>>  --
>>  2.28.0


