Return-Path: <linux-next+bounces-4788-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 989239C851F
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 09:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEBECB28BD0
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 08:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA36C1F756D;
	Thu, 14 Nov 2024 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHNI5Fqm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3AB198E84
	for <linux-next@vger.kernel.org>; Thu, 14 Nov 2024 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731573916; cv=none; b=jehLFyGrAVrUTJFmbh6dfQGfePmXPfYh9oMH8eyJQB2yGwi9FNEAe5iTAB0YXF7xWLGNuX2Rr6p+3W4L2NPBERzXOkJ9VBMPWMdiCDzlXzVmNz3dPXkgRL1UBZ1bRzlf6ixnKR2cN5Crfou2RSWXRAMreeUZh9OlCmFSQWD7wAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731573916; c=relaxed/simple;
	bh=0nAr9CgPwwa4383ED9JVYTEnqtVWSatARUNM6hcdfEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qi93NjLcv3jAfuGKn7rDYNVOe2s4KCqK9zSUVdWJc2VHxk9+9sJdu7onFrQ7TayM4ucu3TkUI7lbB4TIazmVoCqpG8Rq5L4iRvuhnnDeP7P3R7I8RKnpFljJ6IgWOTd8Y8O6CM0YlK/fIelbyIpQSy9hb+uxSl4PXgl3KesNz9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHNI5Fqm; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6eb0c2dda3cso3891327b3.1
        for <linux-next@vger.kernel.org>; Thu, 14 Nov 2024 00:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731573913; x=1732178713; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k+Lge5lw10SGbs4DANZU2moBw8on3pmDvP4g57FGYV8=;
        b=cHNI5FqmFAp7aUeln3aHewxQaneWraS6GyaBJOm73C/xa1indCXfyO10MncCoNtq37
         t/gEGIEMLcpqk/GJXHbvxpYOQ/wSpyib7t+O63Cijw59Iqv54s/Ny7XuchSfEbGWi3HW
         8hqgqF4T2xZnazVFjhW3XOZXh0gIrjPkygsBPkSvX9oEhfm4/lqwRnpww7h9P5aEUUu5
         z/crDAT60G3fj8hs/TaxKjYhIjKKWDCC9rPEYgrvqPkonEVGJFxNMv4Aq0v5HJ0LT3ww
         lrqtOY0KMnKUkLZNmGfNpiMZyzyy6MVHQ+yhhiDqgsC7d59RVcyBAdTXrsrT8+DLkKoh
         WMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731573913; x=1732178713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+Lge5lw10SGbs4DANZU2moBw8on3pmDvP4g57FGYV8=;
        b=JXcc45yNHFKDzzYvY7Vxjmko0JnYMBCba6vmgexRqfp9SJwbFPDNY02UgaeJyN6cze
         KIMkTIT5P4TWN5SOm9WBSAFIfK4B/sLowfu/0H38ffd1gDgk09ilO5hVdRDmuBg+J9KY
         VmS+AJlc46hYzQtw7cNmHdbTCGZ4AaxN1MADZPXnI0udfoiE7mZZOOUeDHO7FakZpjX6
         GxK2rUhLQGXKDgWbL0n6SO3o8Wu3eDP8kMZwVcgB4C9KDhIzfhHGeVIBH7Ip+BqwxJ/W
         aXT0xkCpxFc+2x5MWLyjn/zdT4ZGPsv9LQpgCawJPTPATwuUwLti0NsurWzINwR8AlC0
         N2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUsetrVE/0E2zzPay1dxSZYY4NPeLfMl4nLjEX3u2PeN7SLU9BoXi2R5/RFbmylD+Cb17LCaAmbSU3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+osfnVQOHz2xX9uPWi+WyPALC+RhXyJCpcZ07e074siDzPoLD
	EAielADhfT1lqESL5oRKN/5OvC7BBXlyj8nYDHSBrSi3nt6McWcQGoFzOnwMTSr8Sg7QFD+DuWw
	qnWlZweZvgE9zVcPPBngzScvZiL/2PHRrINo40w==
X-Google-Smtp-Source: AGHT+IEHacuOwS6NTvCWJvOywx9R7oLnu4ZHdY9f95fcIcWWbJeN5XffysgqE2a19dukPv8VIY+yElhWsLSxYCJcptE=
X-Received: by 2002:a81:b105:0:b0:6ea:8a5e:7fbd with SMTP id
 00721157ae682-6eaddd8aea0mr190722817b3.2.1731573912932; Thu, 14 Nov 2024
 00:45:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114110347.04ef829f@canb.auug.org.au>
In-Reply-To: <20241114110347.04ef829f@canb.auug.org.au>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 14 Nov 2024 09:45:02 +0100
Message-ID: <CACMJSeuNPC+=izBa4pN7SYrYP9-Gpf18FuNfSvzbBtHrsGG0KA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Krishna chaitanya chundru <quic_krichai@quicinc.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Nov 2024 at 01:03, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the pci tree got a conflict in:
>
>   drivers/pci/probe.c
>
> between commit:
>
>   1d59d474e1cb ("PCI: Hold rescan lock while adding devices during host probe")
>
> from Linus' tree and commit:
>
>   dc421bb3c0db ("PCI: Enable runtime PM of the host bridge")
>
> from the pci tree.
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
> diff --cc drivers/pci/probe.c
> index f1615805f5b0,bf4c76ec8cd4..000000000000
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@@ -3105,9 -3127,18 +3127,20 @@@ int pci_host_probe(struct pci_host_brid
>         list_for_each_entry(child, &bus->children, node)
>                 pcie_bus_configure_settings(child);
>
>  +      pci_lock_rescan_remove();
>         pci_bus_add_devices(bus);
>  +      pci_unlock_rescan_remove();
> +
> +       /*
> +        * Ensure pm_runtime_enable() is called for the controller drivers
> +        * before calling pci_host_probe(). The PM framework expects that
> +        * if the parent device supports runtime PM, it will be enabled
> +        * before child runtime PM is enabled.
> +        */
> +       pm_runtime_set_active(&bridge->dev);
> +       pm_runtime_no_callbacks(&bridge->dev);
> +       devm_pm_runtime_enable(&bridge->dev);
> +
>         return 0;
>   }
>   EXPORT_SYMBOL_GPL(pci_host_probe);

Looks good to me, thanks.

Bartosz

