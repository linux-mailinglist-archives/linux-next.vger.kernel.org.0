Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4A82BA34D
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 08:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgKTHda (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Nov 2020 02:33:30 -0500
Received: from mga11.intel.com ([192.55.52.93]:57421 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726529AbgKTHda (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Nov 2020 02:33:30 -0500
IronPort-SDR: DUaD02YoBkpu5M6FEADG6i/zp3uLtjVb/PX5EFqFF3XJArdcT08EgG//g8XG4bN7DaRRM0sb/x
 bGAMWwCCcUOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="167919215"
X-IronPort-AV: E=Sophos;i="5.78,355,1599548400"; 
   d="scan'208";a="167919215"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 23:33:30 -0800
IronPort-SDR: SF7R8f0NKpmozNvLTy83J7i8bMMqj5wVqxojeldfJ09W//hhjiBfzQei9UCaMnLWes3Qm8J1jx
 8s4NxRK05U2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,355,1599548400"; 
   d="scan'208";a="431495349"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 19 Nov 2020 23:33:27 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 20 Nov 2020 09:33:26 +0200
Date:   Fri, 20 Nov 2020 09:33:26 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Fix num_altmodes kernel-doc error
Message-ID: <20201120073326.GB4120550@kuha.fi.intel.com>
References: <20201120063523.4159877-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120063523.4159877-1-pmalani@chromium.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 19, 2020 at 10:35:22PM -0800, Prashant Malani wrote:
> The commit to introduce the num_altmodes attribute for partner had an
> error where one of the parameters was named differently in the comment
> and the function signature. Fix the version in the comment to align with
> what is in the function signature.
> 
> This fixes the following htmldocs warning:
> 
> drivers/usb/typec/class.c:632: warning: Excess function parameter
> 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> 
> Fixes: a0ccdc4a77a1 ("usb: typec: Add number of altmodes partner attr")
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/class.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index e68798599ca8..cb1362187a7c 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -618,7 +618,7 @@ EXPORT_SYMBOL_GPL(typec_partner_set_identity);
>  /**
>   * typec_partner_set_num_altmodes - Set the number of available partner altmodes
>   * @partner: The partner to be updated.
> - * @num_alt_modes: The number of altmodes we want to specify as available.
> + * @num_altmodes: The number of altmodes we want to specify as available.
>   *
>   * This routine is used to report the number of alternate modes supported by the
>   * partner. This value is *not* enforced in alternate mode registration routines.
> -- 
> 2.29.2.454.gaff20da3a2-goog

thanks,

-- 
heikki
