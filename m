Return-Path: <linux-next+bounces-6020-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F69CA713A7
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 10:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 388A316A43E
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 09:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBFE189B91;
	Wed, 26 Mar 2025 09:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="E9DVlVR3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52E619ADBA
	for <linux-next@vger.kernel.org>; Wed, 26 Mar 2025 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742981118; cv=none; b=Rqd9PSB6Juswqty1BB4ciiBdRLpKg5h8qJoEl5n+ud20MgbJn9dILB/Zfchot/4KZYI30GX6qC5MmbJD3mWponQJjiuMkb5DI0t3vRdZWAhyekIqL4llQtsa3Gc+fVVg7NXv5N+kN8jQre8sdOIbhfvsM7gzl+7dBcvkTB4uP4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742981118; c=relaxed/simple;
	bh=1cEyaF63q/x3VGPCgdsugifRXvRW4j5br3BkdE2QNIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIOsi70pvS2S3Y4gZQlKYdTaNWPHa+0bB7HlNEFbBfqLQDVD+5ux5Z0KIX+eZIl4cFWm/q60w5FOLH3Y2uXKR1nmGcKCg0iE1tik07ixErYZ1yLO7sj/RyTk9fxkW/zI6aJecsSC9/GCUxVCYhw046osDTPNQzTAQtnaxawUvVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=E9DVlVR3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso992646166b.1
        for <linux-next@vger.kernel.org>; Wed, 26 Mar 2025 02:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742981115; x=1743585915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1cEyaF63q/x3VGPCgdsugifRXvRW4j5br3BkdE2QNIM=;
        b=E9DVlVR30wc8A7MqtD6FdhmRKf5WG7HH+cM3IgMzFPkW11DdzCk/yZi5RCW0C3GnU2
         Anhxtw4wddppbTjNDDS94ZpA4c87IK7nroxIk/7oSom/fsWqbOu1ObZLMNL01RrKfuF2
         zZABryYNXVnegKsDzNI6ivgeBIWNlFwH1/n/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742981115; x=1743585915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cEyaF63q/x3VGPCgdsugifRXvRW4j5br3BkdE2QNIM=;
        b=bd3SK6btsquV3QGJ1sFd+fR5bkcVWW4G8Bwij7qLzbXHW3+tGuA1BiXzQNXFgLCyhh
         ZeocGSL0LwPkBM54D3tzJ7KP5ESK+cOXD5HtRkDlNrEHeqpusbo+Uo1jWDbDhYQUy3g+
         g+bgjULdWjNu+rrldoWwt9d5jAN3Qrw6dvWHTb3MksNpShBUbfurQRaSOJ8q/g80XQH1
         TiywdSU9Gr9W1phQ1QdOcnF3ZB976GWAF6cTycIY582ZXp5KEEPIGwwE5DRbbJHQDvqf
         B9/YbJRDuCaFWKlokSsy10Hq2euLz9By2Fe+3QQ54Tb8WpIIH16M1aOGGTFLc06PuYvR
         pgWg==
X-Forwarded-Encrypted: i=1; AJvYcCWdgLFbgDTHuu6zNG5g+Z2jdX2RYomBF+hX3xr0pYl8MGGc3+LNHEIWKiik00m8J6dErAwqOXaJnPHy@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc2r0OyWhl9o+soIJ08MOgNkQiC2KOmE0E1U6BpP+0OhfZxNai
	qmFGHzvh6omN23IrE1sJrvXtuaHQhZhl4E6liFZw7Qr0ndI5wHDy3ziT1IIbuJU=
X-Gm-Gg: ASbGncviLtT6GGIVdcfOAudu5/6uzd28Wb5UcucjjcrEFx5S6+H9lox+bvOldQkJAv6
	g5fjinByq34VFhq5lMHPttgKZ6QL9l+rJfIqkdmlJKVLAjgZBwb/o9BqsnvlnIWkqvMvgXC4WPw
	dVtQMYucx4JTZsMcqw8f7GlqfOjra8Y4htT2acghSYiFxuMZbT5GlytGigHI1CHSui47qInkOpj
	m9wskkp5ogW6nvY0JA7e38jvivFu+MQv60Ud0/Lu3ZX0Vf63r+f3EuBz958VGrDpQfZBDYNx+/V
	eTHnOOThxAWsmRzLjNNCLlrf0jrpsxdfI/xWwK8v0Unx2FvLaw==
X-Google-Smtp-Source: AGHT+IGe+y82L5+gj9QzxBEdZHdajohPp3RW6/DSFWXrlV5r8AaiNFRvvNJjTG5Ejwz4trhnQT/f8Q==
X-Received: by 2002:a17:907:d786:b0:ac2:7ec8:c31d with SMTP id a640c23a62f3a-ac3f210aa96mr1964769266b.17.1742981115065;
        Wed, 26 Mar 2025 02:25:15 -0700 (PDT)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac3ef93e17asm1003921866b.78.2025.03.26.02.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:25:14 -0700 (PDT)
Date: Wed, 26 Mar 2025 10:25:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: 423b87d8-2ae3-48af-b368-657f1fbab88d@amd.com
Cc: "Aithal, Srikanth" <sraithal@amd.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, bhelgaas@google.com,
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com,
	linux-next@vger.kernel.org, Juergen Gross <jgross@suse.com>
Subject: Re: [syzbot] [pci?] linux-next test error: general protection fault
 in msix_capability_init
Message-ID: <Z-PH-fYvtSF8v4Ae@macbook.local>
References: <20250325223752.f5tjazbpbblgppyz@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325223752.f5tjazbpbblgppyz@amd.com>

On Tue, Mar 25, 2025 at 05:37:52PM -0500, Michael Roth wrote:
> Also able to reproduce this trace on every boot with a basic KVM guest on an
> EPYC Milan system using next-20250325 for both host/guest.

Sorry for the breakage, there's a fix from Thomas at:

https://lore.kernel.org/xen-devel/87v7rxzct0.ffs@tglx/

Regards, Roger.

