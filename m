Return-Path: <linux-next+bounces-6253-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9196FA89D12
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 14:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C00363ADFCC
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 12:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB34294A04;
	Tue, 15 Apr 2025 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="DOgm08n0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vFaXJ+Fg"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8950B2750F2;
	Tue, 15 Apr 2025 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718571; cv=none; b=J0WZEo4Z3YQMe3ChQioVQ4WNhTioZYclIjwpjKzXOuFc1B+5Ganr3jsCixPdHLMcm1hF1XP4oaT2eegcoG4ZbTk3DK0vVxf4ZvhAkiKC3n31fI+eZ3Tmpgebd9KsYy6CK0NgdygQ7Rr6Pe85z0F2Qg9wm02Kg3X/zQeqereEqXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718571; c=relaxed/simple;
	bh=AChvJoirDehSDR6uU0vicySH5LtTiU+YmzZJQukbyD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSWiYAHLvF2z42sSXQduSmKKhB8LfehviiF6/trSVP7d8VNlPpVu0NQoU6vVZy+tbVG3C99jC9NsBuTspFrlIBQIRHPb78cliHxCroNo2rfLlbwhu2aE3ckbn5b1Ofl8nmu5GIozTk/Az66KZZm7b9YAW/ZNv6mscWtFrbQYvfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=DOgm08n0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vFaXJ+Fg; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 43B721140264;
	Tue, 15 Apr 2025 08:02:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 15 Apr 2025 08:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744718568; x=1744804968; bh=wgCC+I4E8W
	n3UFcFXgf9QzUzO1YrNSpaJwcg9YC1g6Y=; b=DOgm08n0xm7UZdMJa3OXNJcC0m
	kOhQwjr+KwpmbJPEp5TtJM5X++fbF5v2HFOvmOITayI3NQBVBPF0GwxUxmCPGiQK
	X3wxBDG8J5ozDbcc85XkD0SZldW1NwtmU5HV6Uc1V21khbbQm9uTpMedvwrXNWbK
	3zKo+/u/B5logbhCaiWzZRHFRBmjYGzoGjzhx4DF0hlrz9aYOlqJlbnaxTLG8Eco
	6lco33bCmdQAjybRtM9HpAOqlcK2EoHjP4kNj+JuaY8pDgI2o7/wqW98ugQoSNFb
	/9bFH/YMOzOjMZGEpHPGipoV9uKXZR/scO1uJy70MCs4ZtucBgja7PeDP/7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744718568; x=1744804968; bh=wgCC+I4E8Wn3UFcFXgf9QzUzO1YrNSpaJwc
	g9YC1g6Y=; b=vFaXJ+Fg7sfPjwcewXjdmN8FzNTaYqjUvo2e5HKgbjy8XEcEmCW
	VzdknVrZE5qdxrFYURxgd4NNZ2Bo4q76BY04J4lbt9zrXyaGN6IXDXGXuw+Xz3pY
	qWhhxE9zJYs3A0lFHxUnYZ7qFadFlqEruQElnPcuMpgtNZ3+6JSIj8pENW3xedrG
	ndVdTMcuGdHXzdf/qdGwrCRNt9BEr8E46lv1QcqiTdEswo+1vC8jkpdtcCfvfoJK
	r1k4k6cjfc+JiAS8LFhRc4DX6DRjn/kRXheIptfPSOoBoPOWmO2NQwG5cCSeVoR8
	+u5dejHblWTTc1MMCbSs2lYxNZj2sLMSFmQ==
X-ME-Sender: <xms:50r-ZwaysHNayACQ9vp6Zw_Nl8o-xmgxI29bE2VxYwAENXkeNfQcAA>
    <xme:50r-Z7ZMq5s6aTl2KwUtLyyFV8rWHDdB1EtQ_HOEXZe4igTQNV8Hwf6FhaSbrWNG5
    _epZW2g8ft3pw>
X-ME-Received: <xmr:50r-Z6-FA7KaiDIRTOqq2KC2gNiR7RXbW_rKIlpnAAmmqtBrhJb_9omVwYYAUt0Tr7xh8ifIcKqQgjCKurgpH9K8QQYvStg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtohepphgthhgvlhhkihhnsehishhprhgrshdrrhhupdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    gihurdihrghnghgpvdesnhigphdrtghomh
X-ME-Proxy: <xmx:50r-Z6qR0jkroaWjpkrY9aG2Yxzo_MS5J0rqtN5GW60hG2jUAfhxGg>
    <xmx:50r-Z7qFgr6wArAuLhf0jpX6X6E5J08JUAoZ5p8IgKeQMMOqahEB1w>
    <xmx:50r-Z4SoFnZDjI0yF5Y_DCt0GEwVY3gu5INpRc42zNh2vsx8TgDsBA>
    <xmx:50r-Z7rpWeeCCUMFbVp5gHQW58-oTx3jKoXoaAYmSWH0__pvN0B5Zw>
    <xmx:6Er-Z5ISl9cVf8fu93ydu9kSt6fdHe9_sfpWVqTgKns05Dm08L4G7Cw7>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Apr 2025 08:02:46 -0400 (EDT)
Date: Tue, 15 Apr 2025 14:02:44 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <2025041538-bootlace-tumbling-1b40@gregkh>
References: <20250414142307.7df3443d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414142307.7df3443d@canb.auug.org.au>

On Mon, Apr 14, 2025 at 02:23:07PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/chipidea/ci_hdrc_imx.c
> 
> between commit:
> 
>   8cab0e9a3f3e ("usb: chipidea: ci_hdrc_imx: fix call balance of regulator routines")
> 
> from the usb.current tree and commit:
> 
>   ee0dc2f7d522 ("usb: chipidea: imx: add wakeup interrupt handling")
> 
> from the usb tree.
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
> diff --cc drivers/usb/chipidea/ci_hdrc_imx.c
> index 4f8bfd242b59,c34298ccc399..000000000000
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@@ -336,13 -338,16 +338,23 @@@ static int ci_hdrc_imx_notify_event(str
>   	return ret;
>   }
>   
>  +static void ci_hdrc_imx_disable_regulator(void *arg)
>  +{
>  +	struct ci_hdrc_imx_data *data = arg;
>  +
>  +	regulator_disable(data->hsic_pad_regulator);
>  +}
>  +
> + static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> + {
> + 	struct ci_hdrc_imx_data *imx_data = data;
> + 
> + 	disable_irq_nosync(irq);
> + 	pm_runtime_resume(&imx_data->ci_pdev->dev);
> + 
> + 	return IRQ_HANDLED;
> + }
> + 
>   static int ci_hdrc_imx_probe(struct platform_device *pdev)
>   {
>   	struct ci_hdrc_imx_data *data;

Looks good, thanks!

greg k-h

