Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76BC2227B4
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 17:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgGPPpP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 11:45:15 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34359 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728126AbgGPPpP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2020 11:45:15 -0400
Received: (qmail 1114215 invoked by uid 1000); 16 Jul 2020 11:45:10 -0400
Date:   Thu, 16 Jul 2020 11:45:10 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     linux-next@vger.kernel.org, gustavoars@kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, qiang.zhang@windriver.com,
        "Wanghui \(John\)" <john.wanghui@huawei.com>
Subject: Re: [PATCH -next v2] usb: usbtest: reduce stack usage in test_queue
Message-ID: <20200716154510.GE1112537@rowland.harvard.edu>
References: <20200716082735.66342-1-cuibixuan@huawei.com>
 <42fe1a83-38a5-816b-9258-8a344008f398@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42fe1a83-38a5-816b-9258-8a344008f398@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 16, 2020 at 09:47:10PM +0800, Bixuan Cui wrote:
> Fix the warning: [-Werror=-Wframe-larger-than=]
> 
> drivers/usb/misc/usbtest.c: In function 'test_queue':
> drivers/usb/misc/usbtest.c:2148:1:
> warning: the frame size of 1232 bytes is larger than 1024 bytes
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  drivers/usb/misc/usbtest.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> index 8b220d56647b..a9b40953d6bc 100644
> --- a/drivers/usb/misc/usbtest.c
> +++ b/drivers/usb/misc/usbtest.c
> @@ -2043,7 +2043,7 @@ test_queue(struct usbtest_dev *dev, struct usbtest_param_32 *param,
>  	unsigned		i;
>  	unsigned long		packets = 0;
>  	int			status = 0;
> -	struct urb		*urbs[MAX_SGLEN];
> +	struct urb		**urbs;
> 
>  	if (!param->sglen || param->iterations > UINT_MAX / param->sglen)
>  		return -EINVAL;
> @@ -2051,6 +2051,10 @@ test_queue(struct usbtest_dev *dev, struct usbtest_param_32 *param,
>  	if (param->sglen > MAX_SGLEN)
>  		return -EINVAL;
> 
> +	urbs = kcalloc(MAX_SGLEN, sizeof(*urbs), GFP_KERNEL);

Since you know at runtime how many URBs will be needed, why not use that 
information?  Change MAX_SGLEN to param->sglen.

Aside from that,

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
