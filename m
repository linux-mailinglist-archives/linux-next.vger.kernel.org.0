Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67EA34C3B0
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 08:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhC2GPJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 02:15:09 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:54353 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229441AbhC2GPA (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 Mar 2021 02:15:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 00B8E5C007B;
        Mon, 29 Mar 2021 02:15:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 29 Mar 2021 02:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=kcWXdogmp335G1CcpzZxRZDVY5U
        I+zhyXcj+rDT8BfM=; b=nVfF42qWCSux9egJ+c2GSZik5yM5E9n084/PfLQk+xP
        +GlGE7MMiflLlm/ZVQ7yPlgZF5U4RHyaXw5hjguuQGP2nkW+HWs+p8ARV2d7zojf
        f3oI48dBZhXmDfUd5bavG8VYFJ/P3Z0gOX/xqMlIHkvdpN6rkRvpXaNEs65xc53M
        0r+7jvqkcmpwU5R0odoo6LPFnpO2eynCqfiv+HH0Vwbz3Oc+JT77MaFFFmfr2QtJ
        qMCiyFsrbmHtWxNRum0btEzVsOctgboKcC0GQUsLO4zy5nQG2iwpTsWk4kj1WukL
        9hY6wwYk9g5WRpGiX3r7HRYyCF28V8GPjx9jcynugfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kcWXdo
        gmp335G1CcpzZxRZDVY5UI+zhyXcj+rDT8BfM=; b=EYQ6u8kWSWfQXwZfWRV8F8
        EBApicDpDp1GLlzTT/d6t1/wnQuBS21NSEaqOe8bappmPdZogpBPBrSPvHkHqsIv
        zJr1OzrETPS2AqSX6uaDdXp1MdEJUyDMZ1kIhFGXmsDvTm2aPBjEIBs1ZF9XNeBi
        TgKIJgEHDi4FqdRynWFGv4lHcwwFxY0P3eUjItsVoen7LCmyT2MctfBmYRRV5ePz
        2TmLI9cDYyTASXMgA5o1M0Yy5z1kwISciVMPSeSfL5nB3upreKZwWbZwR8Nfwy6n
        FGMNtchVDB3WKUOu/4QnGt1MH81eHJpo1mL/akSRa3mWzAoha6BbH0ECh8DbGxsQ
        ==
X-ME-Sender: <xms:YnBhYIQ3NWg1gVpVvT3viMvY6elMoykDY23mKvsgbPi-LsH9Lpm_6A>
    <xme:YnBhYFxXLxwqaN0mbBWIDKPVT68xa649jtOR6c5Q3N8cN6wBPM5U0CoMgVKuBis37
    wQk8lXFipGnpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehjedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:YnBhYF0y1dA89kM4ttnPqh4edUnE6n5xL5MvtcfcBtt0JWJoViUyCw>
    <xmx:YnBhYMBrpc6t_Y7dIHRG9T9Cqsywxh_6cbccJ40K5ifPE0P_LjLU_g>
    <xmx:YnBhYBglgay7rY5EvY3CL2YjmkQKxL39PEH5vjSqOAJPpW4BRQ29sA>
    <xmx:Y3BhYBejFGZygZ1HDlVg2Y-8s0rR9T5m7i0suvKpFwAZ4bf7d7dKUg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id D3592240054;
        Mon, 29 Mar 2021 02:14:57 -0400 (EDT)
Date:   Mon, 29 Mar 2021 08:14:50 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <YGFwWq//sh6onrUH@kroah.com>
References: <20210329165525.32d51a3a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329165525.32d51a3a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 29, 2021 at 04:55:25PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/iio/adc/ti-ads131e08.c: In function 'ads131e08_read_reg':
> drivers/iio/adc/ti-ads131e08.c:180:5: error: 'struct spi_transfer' has no member named 'delay_usecs'
>   180 |    .delay_usecs = st->sdecode_delay_us,
>       |     ^~~~~~~~~~~
> drivers/iio/adc/ti-ads131e08.c: In function 'ads131e08_write_reg':
> drivers/iio/adc/ti-ads131e08.c:206:5: error: 'struct spi_transfer' has no member named 'delay_usecs'
>   206 |    .delay_usecs = st->sdecode_delay_us,
>       |     ^~~~~~~~~~~
> 
> Caused by commit
> 
>   d935eddd2799 ("iio: adc: Add driver for Texas Instruments ADS131E0x ADC family")
> 
> interacting with commit
> 
>   3ab1cce55337 ("spi: core: remove 'delay_usecs' field from spi_transfer")
> 
> from the spi tree.
> 
> I have applied the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 29 Mar 2021 16:51:22 +1100
> Subject: [PATCH] iio: adc: merge fix for "spi: core: remove 'delay_usecs'
>  field from spi_transfer"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/iio/adc/ti-ads131e08.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads131e08.c b/drivers/iio/adc/ti-ads131e08.c
> index 0060d5f0abb0..764dab087b41 100644
> --- a/drivers/iio/adc/ti-ads131e08.c
> +++ b/drivers/iio/adc/ti-ads131e08.c
> @@ -177,7 +177,10 @@ static int ads131e08_read_reg(struct ads131e08_state *st, u8 reg)
>  		{
>  			.tx_buf = &st->tx_buf,
>  			.len = 2,
> -			.delay_usecs = st->sdecode_delay_us,
> +			.delay = {
> +				.value = st->sdecode_delay_us,
> +				.unit = SPI_DELAY_UNIT_USECS,
> +			},
>  		}, {
>  			.rx_buf = &st->rx_buf,
>  			.len = 1,
> @@ -203,7 +206,10 @@ static int ads131e08_write_reg(struct ads131e08_state *st, u8 reg, u8 value)
>  		{
>  			.tx_buf = &st->tx_buf,
>  			.len = 3,
> -			.delay_usecs = st->sdecode_delay_us,
> +			.delay = {
> +				.value = st->sdecode_delay_us,
> +				.unit = SPI_DELAY_UNIT_USECS,
> +			},
>  		}
>  	};
>  
> -- 
> 2.30.0
> 

Thanks for the fix, looks correct to me.

greg k-h
