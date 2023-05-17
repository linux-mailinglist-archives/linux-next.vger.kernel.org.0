Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3342D707070
	for <lists+linux-next@lfdr.de>; Wed, 17 May 2023 20:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjEQSIx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 May 2023 14:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjEQSIw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 May 2023 14:08:52 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27064B0;
        Wed, 17 May 2023 11:08:51 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4QM1M16wqLz49Q4J;
        Wed, 17 May 2023 21:08:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1684346928;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tiLcdj+637utbguDBNkK5wark73uP2Co8cs3kwg/U9Q=;
        b=jQUSyk2FZQA1vU6JewWipW+cdKwkZDlarhm1oGeeUNfSLDKi7I7q62g58ZGvOO9vBAPKY0
        J/MvGuTDf2yOvFIclsp8tkj/EdPQVLFQ0+2Eri6T92PfgxSN3hAOzY6hhngEX6DSBOQVT8
        Chqp+7MCbdGbjn1kLst9swohuuh3Fo8Ubl1BRz0h8cJD2m/VdrYwzIQeC/U10PbFUWvQhj
        sugObrCuBmliu8g1nPfyOVEExa64L8KOQC2hwXgcBXEQ9DUKBNmih9SUpitpbgSF43Rekr
        gAW+P/AU3sWC5I2HbYck7iSyZpa0locfKYx0vJFbsaOt14HXUdQR9WMBtfeovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1684346928;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tiLcdj+637utbguDBNkK5wark73uP2Co8cs3kwg/U9Q=;
        b=ovVYV30Wze3B8zwIdQiQ7irLhEb2cTtgixz94tIKAnEZw68IViapHBsjkEl47BpSaAsd1s
        jP3KQ0q39yl3O7Syslicamj0onYzWPtHuGAvyD9ojslDHrr1+8BDbLhJ9RkRKEVu5UKicP
        Be67/au/bGigpWGiVZjmnc+PDIkzsmW1QF4Q6sHE5NzzVDAXprdtc5FXBT+9tVJVt3a9Ev
        09moEyMXLR7F4dCoF+nDDJ1vsu0dU07taKsowvCR6tXV0txj/CpfZ8c+gbt4OEcXY1edpu
        RcF1fnA04082M0Rf28NZkW/ThszPcJKzcwXMFyxwcly8CS2QiyPOcrljrqZjsg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1684346928; a=rsa-sha256;
        cv=none;
        b=H1iG8yu+ooQ78ue0lMr+mkXE4wKY7y+poodJyXet7ili2TXm1glQWtgLb+ILV4WoOBsVI2
        +oa5fpbhPPUoY8YSungTdIeiu7JFDBfHDd2/PQmHHom1SEnpW0AB/YRHifpkjg/dlZ5B/c
        njsxCv8gigEebQJ8AczrHMj5QuCPC9i3HjZFWFyQDd4ZorkBVirN/zUrx0xvOoLzXEEk/M
        ZTeUSejxiJGsdR4cXLuQZasn1JtYwOL/lijQFM3HfUmuszyvWh47MCpdOwqv/CHnZm21lQ
        iJ5Q5zlAHvUa4P7PSl/+B4JwJ2ISLzimL29XA7Av2CIAKgFmSj4hKan3/2Yifg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4173A634C94;
        Wed, 17 May 2023 21:08:45 +0300 (EEST)
Date:   Wed, 17 May 2023 21:08:45 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Intel Graphics Development List <intel-gfx@lists.freedesktop.org>,
        DRI Development List <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matt Roper <matthew.d.roper@intel.com>,
        Gustavo Sousa <gustavo.sousa@intel.com>,
        Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
        Matt Atwood <matthew.s.atwood@intel.com>,
        =?iso-8859-1?Q?Jos=E9?= Roberto de Souza 
        <jose.souza@intel.com>,
        Srinivasan Shanmugam <srinivasan.s@intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 3/3] media: v4l2-core: Describe privacy_led field of
 v4l2_subdev
Message-ID: <ZGUYLR4QT7Wb/Ly9@valkosipuli.retiisi.eu>
References: <20230203100215.31852-1-bagasdotme@gmail.com>
 <20230203100215.31852-4-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203100215.31852-4-bagasdotme@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Bagas,

On Fri, Feb 03, 2023 at 05:02:15PM +0700, Bagas Sanjaya wrote:
> Stephen Rothwell reported htmldocs warning:
> 
> include/media/v4l2-subdev.h:1088: warning: Function parameter or member 'privacy_led' not described in 'v4l2_subdev'
> 
> Describe privacy_led field to fix the warning.
> 
> Link: https://lore.kernel.org/linux-next/20230203135303.32da1fc6@canb.auug.org.au/
> Fixes: 10d96e289fbd77 ("media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  include/media/v4l2-subdev.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1ef5bbbf9d38c8..3e7a97c0657e1c 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1033,6 +1033,7 @@ struct v4l2_subdev_platform_data {
>   * @active_state: Active state for the subdev (NULL for subdevs tracking the
>   *		  state internally). Initialized by calling
>   *		  v4l2_subdev_init_finalize().
> + * @privacy_led: Privacy LED associated with the sub-device.
>   * @enabled_streams: Bitmask of enabled streams used by
>   *		     v4l2_subdev_enable_streams() and
>   *		     v4l2_subdev_disable_streams() helper functions for fallback

I'm not sure how this ever was an issue --- privacy_led field was
documented in the same patch that added it.

-- 
Kind regards,

Sakari Ailus
