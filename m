Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856C838C75E
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 15:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhEUNDE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 May 2021 09:03:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:7839 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230081AbhEUNDA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 May 2021 09:03:00 -0400
IronPort-SDR: Ztk034FzyM6I/QkKm6Bpp5KgNSWV43hC0CfY8IUvskmR2hCOlD5Wm/bPaRu/+uYFRi6uwph/Sr
 c+ghkGmdQoyg==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="265385484"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="265385484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 06:01:32 -0700
IronPort-SDR: nupcxKObsJD8BWIpL/p2n6IzvvP5iR1FzhPR9t4G0QsaG/AOO0CAUMiJlhCndNf4TqXQkwIzHQ
 tNzGxxVBr3dw==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="631801791"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 06:01:29 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lk4mM-00DiC0-Sa; Fri, 21 May 2021 16:01:26 +0300
Date:   Fri, 21 May 2021 16:01:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: linux-next: manual merge of the pinctrl tree with the jc_docs
 tree
Message-ID: <YKevJlXRw4F3CqUf@smile.fi.intel.com>
References: <20210521141728.6f5e3621@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521141728.6f5e3621@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 21, 2021 at 02:17:28PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the pinctrl tree got a conflict in:
> 
>   include/linux/pinctrl/pinconf-generic.h
> 
> between commit:
> 
>   4b0c9948a4c2 ("docs: update pin-control.rst references")
> 
> from the jc_docs tree and commit:
> 
>   57b55eeb7552 ("pinctrl: Keep enum pin_config_param ordered by name (part 2)")
> 
> from the pinctrl tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Seems correct to me, thanks!

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc include/linux/pinctrl/pinconf-generic.h
> index 5a96602a3316,98ed5959ca9a..000000000000
> --- a/include/linux/pinctrl/pinconf-generic.h
> +++ b/include/linux/pinctrl/pinconf-generic.h
> @@@ -81,6 -81,10 +81,10 @@@ struct pinctrl_map
>    *	passed in the argument on a custom form, else just use argument 1
>    *	to indicate low power mode, argument 0 turns low power mode off.
>    * @PIN_CONFIG_MODE_PWM: this will configure the pin for PWM
> +  * @PIN_CONFIG_OUTPUT: this will configure the pin as an output and drive a
> +  * 	value on the line. Use argument 1 to indicate high level, argument 0 to
>  - *	indicate low level. (Please see Documentation/driver-api/pinctl.rst,
> ++ *	indicate low level. (Please see Documentation/driver-api/pin-control.rst,
> +  *	section "GPIO mode pitfalls" for a discussion around this parameter.)
>    * @PIN_CONFIG_OUTPUT_ENABLE: this will enable the pin's output mode
>    * 	without driving a value there. For most platforms this reduces to
>    * 	enable the output buffers and then let the pin controller current



-- 
With Best Regards,
Andy Shevchenko


