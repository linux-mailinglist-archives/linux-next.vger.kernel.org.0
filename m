Return-Path: <linux-next+bounces-615-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F1824080
	for <lists+linux-next@lfdr.de>; Thu,  4 Jan 2024 12:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD4631C2183D
	for <lists+linux-next@lfdr.de>; Thu,  4 Jan 2024 11:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192CA21110;
	Thu,  4 Jan 2024 11:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CkCcC81e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9217221103
	for <linux-next@vger.kernel.org>; Thu,  4 Jan 2024 11:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-556ea884968so483401a12.3
        for <linux-next@vger.kernel.org>; Thu, 04 Jan 2024 03:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704367267; x=1704972067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qKPYdKug4jHnHkMVUhvNYsHAKauhASNUqaOoyowrxaM=;
        b=CkCcC81e7pxUPbxnGqAeBDgXnUW0N5jiidh0AzksMoDj3DX6007FBlyuC5W463bBoN
         f1xV4nv/PRx090so3Ad8Ss5VWJ4tbg6h1doY52R70zRXVjNQdvwRt5HrpHaEhgzyUYaN
         lf3nfg5lzalWWAw5CLPAOcP9zdIu9nsZLIItzOCnR+iFXDQx5pxqVCsNYSYyfg8oXyTa
         2plNuAYxJYr+Ua3AzAGUyWT1HXFW/IGlNCZPVAA8hdW3mHqlNExLlYYpAcEs5+20jQBz
         NRwswomhmD9DPbw4WHF62Ha5XfxSRhjk3+nZeGkKkQpUO5q+eu6S1tPGJMtDYWw8EUXn
         sWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704367267; x=1704972067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKPYdKug4jHnHkMVUhvNYsHAKauhASNUqaOoyowrxaM=;
        b=MlHVpbwqh3+WUU3AcFQwlPgHFEJqU9mida0AUbFevRJIfaQQOgnJnRbR/rOX6dRhcu
         qos76lYiV8QZHkxNa8Wj125cpwkUyMBYWFzPlJbujbywKGhctUmse3fJFczRusN+4E9g
         M/PyJjQ71thX+yACmztSHCY/jpgJgU5W4q6wKYWKFMuIJuYTUTBYLI4EuUwAhrh4NPYS
         ai14/y1bbhbQzdYDnMocYNfWv0FeFt1eraptSx0MQKyS0oDIsAu0RlsIsjFbqMGMgfQj
         IYZQYsinZFZ9NiQLdF+Ky0fsBmGOxFpCSTAOWx97PYsEmvGw1T9Nsb0Vl1O5XFbXjyT5
         X5Aw==
X-Gm-Message-State: AOJu0YyY41jyopqQFMxqutTi90nq7GW3aaBrKiCjSDbiPXnObOnUwCtl
	OA46eX6ckEbWsGylFVD95nOUPr0P9pfTnw==
X-Google-Smtp-Source: AGHT+IGEPF95NHKVsnpyIHKUm/KgY8I0kv9v78/s4o+1miuTMPSJaURO0LP/yv/+PD12AbmgBJL1yQ==
X-Received: by 2002:a50:bae9:0:b0:555:65c0:e72b with SMTP id x96-20020a50bae9000000b0055565c0e72bmr319888ede.62.1704367266640;
        Thu, 04 Jan 2024 03:21:06 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id w14-20020aa7d28e000000b0055306f10c28sm18642880edq.28.2024.01.04.03.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 03:21:06 -0800 (PST)
Date: Thu, 4 Jan 2024 12:21:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org, 
	atishp@atishpatra.org, rdunlap@infradead.org, sfr@canb.auug.org.au, mpe@ellerman.id.au, 
	npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, pbonzini@redhat.com
Subject: Re: Re: [PATCH] RISC-V: KVM: Require HAVE_KVM
Message-ID: <20240104-6a5a59dde14adcaf3ac22a35@orel>
References: <20240104104307.16019-2-ajones@ventanamicro.com>
 <20240104-d5ebb072b91a6f7abbb2ac76@orel>
 <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>

On Thu, Jan 04, 2024 at 12:07:51PM +0100, Alexandre Ghiti wrote:
> On 04/01/2024 11:52, Andrew Jones wrote:
> > This applies to linux-next, but I forgot to append -next to the PATCH
> > prefix.
> 
> 
> Shoudn't this go to -fixes instead? With a Fixes tag?

I'm not sure how urgent it is since it's a randconfig thing, but if we
think it deserves the -fixes track then I can do that. The Fixes tag isn't
super easy to select since, while it seems like it should be 8132d887a702
("KVM: remove CONFIG_HAVE_KVM_EVENTFD"), it could also be 99cdc6c18c2d
("RISC-V: Add initial skeletal KVM support").

I'll leave both the urgency decision and the Fixes tag selection up to
the maintainers. Anup? Paolo?

Thanks,
drew

