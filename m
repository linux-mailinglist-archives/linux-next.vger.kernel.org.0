Return-Path: <linux-next+bounces-5651-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1104A4FAB4
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 10:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 597151893AF7
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 09:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19ACF2066D7;
	Wed,  5 Mar 2025 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cq8fU8CV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691852063F8
	for <linux-next@vger.kernel.org>; Wed,  5 Mar 2025 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168396; cv=none; b=f1dYJf9l/OM9O71fChVzaF6FujNTknLO/AjK11/cqQrJGb0U4TpJgoQgE2L/Vlb8SkmL6XsyHFXP1Ko7CGqfxSNE7cUfE8RrYlSOlecMoQw8jbyjDXGN+K+jTw+RcdcELc/owVMsCj3ThwrGpC/u8ibarR54R5zaWMyvAEd+uuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168396; c=relaxed/simple;
	bh=HoQJfT/rFHWJRo/w02oVTwpBm6E1113uJMZPkO2so3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2DrEWOLauxAIyIEiW0L8/WEkj5o9ctUffX6SjUcw7+m44MqysEgdM/+dKbMW6hlvDU4h3B6xONetNNg7SZgX5P9rk0y1AwTMU/H/jj2R78UBaOzVNPgcIfaJBWWKKSrSXC8N7HnaBcvVI5LTCPGRAQ+8IZpt4dECkTeo74VDaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cq8fU8CV; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6fbaa0582a6so4520247b3.1
        for <linux-next@vger.kernel.org>; Wed, 05 Mar 2025 01:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741168393; x=1741773193; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QmssJ/v0i5j01lJBGvnparl8jLxew4PBDq3uO0lekbU=;
        b=cq8fU8CVMYuMMMXXkJlOARDlnfNUk0RmQdiIAzmg++S2PRA9gP7r/xQB+2nQrUT1X3
         AoilAz2ffVGmjvWrK93Y6nwM8cKdmSJRxeYtMZ080PMjxhkQZNKsPQ8OGEFY5j27J4JE
         oZ/R+xyXeWZugTVnZwvUnoeSXYOgD3KUKvW7XEQ+8vxh4OmFLXTSaiRuX64ClIZjKWzl
         dzvjQc1C/JJtLDtAlXWbz07rW+/+eXseinc1YGkkYkABARszSYWZjx5Dl3isy+WpSt36
         BiE/q6CDlkdWIHfCK+0N7RPmwyHjGLKAipJsAIk9Fmljhx+ZGVitBFYwWqu94WOvnGST
         wCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741168393; x=1741773193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmssJ/v0i5j01lJBGvnparl8jLxew4PBDq3uO0lekbU=;
        b=VTYAY/ZA4XdP8Ea+opXvmkBNqKzvlRZhaXPontwvp7vPo/7C0GNCtrLFNFksJtBew7
         3xBJwHJlM8OtSy3NkMiyQoJnGst4JsV/rnAgovX/V/rwz+HoNPt9FQEjzKk6MysLhU9Z
         4jxZz8QMiSOEfAoXmwQUkWbIo4K04owkc5IiGegT6HdlhJRLzVjVCrJMJdTQaHNhbWes
         7t3AKfvLrHiqUReimoKGOg+q9WFb4EVZv+yMNvoatuJ3AlToYPpYUzFg35AyYnDviV4i
         +ZVetz+nJEHyryrMz0Yyb/B4wKb5zyoAwUolWFmQN9QtPCR7l7QdBifZFQA6KlaLcbyZ
         F6KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJCgJyrLzVk6BVMy6Ug+/047zaQ4iyfvGqKupLj9RO41rhkg2Y9yHPeK9d6alVH18/kFBwq/bJO+J9@vger.kernel.org
X-Gm-Message-State: AOJu0YxVTJV9Vp1JtE2TtBRMRYVIeljU9Ea3lqMqydAeFW5XI6xRvVGH
	4mIaUsIlrD+PXHXdeucHw7nP2glmbZRvO0TQT+eLDPBSr/VU4/5gPacVkkvsPy9ti9A4glNlW46
	fyM9hmFgVd4R1p39JVt7q8cX+q8aPrY76vtp8KPE6dcnaWacbEcY=
X-Gm-Gg: ASbGnctX0djLtDccoRZDFLkZO1MnzZLBr3aERUfhIIgoQuXohj6EDMfsJdfmz7zqh9Q
	xCw4dmzjV88WVOrgO13Id2HjulDfTrNDU4ajqcVlil9MZTgJByQblgtFHLSeDFUNXd+8acbIR/0
	JclKxRwZh+p4TeqzVUaBCgXVKf5Ou0iWgnAhYHSy/nkbkCmtkjzLfC0rmUsg==
X-Google-Smtp-Source: AGHT+IEGutT+zjkqQ3ATTBx4JIvA9Q3F7rEvdgRWipMrQxGQfkOkxCE0mT1COEBIClGaiCxKi9MsqIyKjbbm3vcPwwg=
X-Received: by 2002:a05:690c:6413:b0:6f9:c8d9:50f with SMTP id
 00721157ae682-6fd9411f614mr96778557b3.2.1741168393332; Wed, 05 Mar 2025
 01:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305203929.70283b9b@canb.auug.org.au>
In-Reply-To: <20250305203929.70283b9b@canb.auug.org.au>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 5 Mar 2025 10:53:01 +0100
X-Gm-Features: AQ5f1JpiBBDeRr2CNNwLxTLAV9GV1VBIlUX83g3DRCPQnKILf_mmS2GzkU3zVO4
Message-ID: <CACMJSetEf-GRjbHh0qwDB0c4C0iXCOBbjV3D4u30x8NbZdAD6A@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the gpio-brgl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 10:39, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the gpio-brgl tree, today's linux-next build (htmldocs)
> produced these warnings:
>
> include/linux/gpio/driver.h:551: warning: Incorrect use of kernel-doc format:          * of_node_instance_match:
> include/linux/gpio/driver.h:569: warning: Function parameter or struct member 'of_node_instance_match' not described in 'gpio_chip'
>
> Introduced by commit
>
>   bd3ce71078bd ("gpiolib: of: Handle threecell GPIO chips")
>
> --
> Cheers,
> Stephen Rothwell

Hi!

I just sent out a patch:
https://lore.kernel.org/linux-gpio/20250305094939.40011-1-brgl@bgdev.pl/

Bart

