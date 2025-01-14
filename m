Return-Path: <linux-next+bounces-5189-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC4EA0FFA4
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 04:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0D2C7A0F9A
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 03:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9646230984;
	Tue, 14 Jan 2025 03:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXxbX8ER"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CFE24024E;
	Tue, 14 Jan 2025 03:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736826172; cv=none; b=qwGEQGdsqdu65ysRAWfg7FPJR2X9BdfmXvMeybNRnXERfO6yG1h6enA7ZfRa1bf3Bu02yDLJK0vYvEa8jVJyEevtGTKXhNLHKFpKpmoCH76ioRaJOKtuyJO4+jJwxVazu7qyf9cVPs8/1oEBPo7MFVqKYR/LjIm5RKBfsdXE8QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736826172; c=relaxed/simple;
	bh=Tsq+iYrSigvKi63CwfSgBybVHmoKOor2sq2C1cFCycc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbOuBAx6VRNV/yQeKIFhBGiS8praYDGfTqv06VzEFLVyqEzwdawpjzKPbgfBkwxiJGM8FKwmDb5DwXixK9jACj+wsnu+RcFXOdtdFMBacWt6zUB5iuncEQstkqyytTcE4Qk2eo3EKUQTCCwhwBnIe+KUTI8BEM60z+fiBi2HuVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXxbX8ER; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5160f80e652so1577502e0c.2;
        Mon, 13 Jan 2025 19:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736826170; x=1737430970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hIjm6evEnvlxh320f3s2DN7xEQSUxfJN8/qPxky5wg=;
        b=jXxbX8ER5CQ0kmNRsIcqHl6c8by7aluA8YS5IEhaeTKXEwFH296kUWoYpizP5KU37a
         JtR/YFxxFrh130FIylRQr9A72uTnifSv4q/Coyc+oYNPjR9nAKMOL3TqYL0z8sMl0p+P
         X9U/4n+a8pv4XKIkd1c+L9UuJyXNIWIMWE7seX6HSES+MkzJb4B1JkOT9aBMzSQUgNmh
         bqFsVc2emxClMFK9F2SzsySBa9vY9KPpo0D1DZ+OFRlaZCyGOXuCWfLdJlOC+lG3nfHp
         8FG6/mtZA4iqZzHT2STwrlo52A0nbwiU1lyjIE9JUcFIkle/4hDqtW6PSFZWPhKh8vi+
         u+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736826170; x=1737430970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hIjm6evEnvlxh320f3s2DN7xEQSUxfJN8/qPxky5wg=;
        b=iKAgLPRkB60XcQFbtARIkg+SVOGCoySljXGVHBk7D+yviZjU5012PcwxYYr4m6AffV
         3EIRIH+ftF71pawh+5569i/NNfZL6pdsHI3UOYQ4cMy1by/FRQBHLFpNlgfoKS5Exn2t
         +cK9q5yBIwBZYGB7+gzYf95Ky88B9qSdErrXzOL5wgZzZYsJSUjF3mKg0xy+FFIvoNZK
         k0yAsEj2tpv4pO+FLNotBGyOpqVq3m5Kf7/8aNnnnwdkYJ3RMZjuW7j1LTiPJc39z9SX
         wKk+SdLnrD1uVxPKYO3lu3UBLonARsg3ZfWNbtLMhrYfgZXPSHTYtPt3A9UNpBo4zA3i
         olUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd/yzKUVmN8FlZhlAIREQAxABwezHk29HPDR5CkVKxqmkA33D0ZSn4+mEgpiUXdPFLU4Ya/fArezx1s8k=@vger.kernel.org, AJvYcCW3ZnLqugEhk0A6z8GBPtpffn8DMZrPQgF++g4nmWojN9sKVXmLIYIByiA5mjg62tAmC8C4fL6cu0P7/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdIgEihaK0rGn+pha3Cqayq6hco8AZPi1MBriAAKHEC8Wzz2h6
	wGLk5JOTwk17Lh4GOv21MTa/0CoYpNLwlVK7YPPbAjwwKZ9/NF9f
X-Gm-Gg: ASbGnctvVy1AYTLiGQwdTVvFLXSxNOrfqsayLqy1LwM7z9VkZIExzNUIVSnEuEtGc2j
	8zavl/WcVBs2Dd19M/3DKgjWhIhExBe2Qmo4nnVff+58gv1a13zEqOJGwEbM1UWnQfZhb2nh4lt
	hmowhsWbLsGqkf8n1CdbmLx7oIpFGnw7blyIyIjkfShbVSalBAKArGTlrTfY4AvX0WHhWNE0TRL
	5Oz5FZloHkPlS593X69lttG/dQz9IdDMSJEYesgZ3ymr7HRTMZH2w==
X-Google-Smtp-Source: AGHT+IHZYk+5HHjuog+X9BxRdhRi5WiEfe7H1bwUrXUqrzCzlCmoGJQpdxwn/sKjmSkZxfgsQ39Jjg==
X-Received: by 2002:a05:6102:292c:b0:4b4:7cb0:ac54 with SMTP id ada2fe7eead31-4b635e22745mr7286835137.5.1736826170104;
        Mon, 13 Jan 2025 19:42:50 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86231362285sm5087446241.14.2025.01.13.19.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 19:42:49 -0800 (PST)
Date: Mon, 13 Jan 2025 22:42:46 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with Linus' tree
Message-ID: <3engxl3k3uclud54qe7lyk33wazdyakf7f2m5cofr2y32hbc7e@avjwoiuksdja>
References: <20250114143229.0c6b8a87@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114143229.0c6b8a87@canb.auug.org.au>

On Tue, Jan 14, 2025 at 02:32:29PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
> 
>   drivers/platform/x86/dell/alienware-wmi.c
> 
> between commit:
> 
>   c1043cdb019e ("alienware-wmi: Fix X Series and G Series quirks")
> 
> from Linus' tree and commit:
> 
>   7c605f6460e8 ("platform/x86: alienware-wmi: Improve rgb-zones group creation")
> 
> from the drivers-x86 tree.
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
> diff --cc drivers/platform/x86/dell/alienware-wmi.c
> index 341d01d3e3e4,b4b43f3e3fd9..000000000000
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@@ -694,20 -690,7 +699,10 @@@ static int alienware_zone_init(struct p
>   
>   static void alienware_zone_exit(struct platform_device *dev)
>   {
> - 	u8 zone;
> - 
>  +	if (!quirks->num_zones)
>  +		return;
>  +
> - 	sysfs_remove_group(&dev->dev.kobj, &zone_attribute_group);
>   	led_classdev_unregister(&global_led);
> - 	if (zone_dev_attrs) {
> - 		for (zone = 0; zone < quirks->num_zones; zone++)
> - 			kfree(zone_dev_attrs[zone].attr.name);
> - 	}
> - 	kfree(zone_dev_attrs);
> - 	kfree(zone_data);
> - 	kfree(zone_attrs);
>   }

Thank you very much. This fix looks good to me.

~ Kurt

>   
>   static acpi_status alienware_wmax_command(void *in_args, size_t in_size,



