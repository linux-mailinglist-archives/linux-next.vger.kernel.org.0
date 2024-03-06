Return-Path: <linux-next+bounces-1496-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F78B872E1A
	for <lists+linux-next@lfdr.de>; Wed,  6 Mar 2024 05:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B36CB23A9A
	for <lists+linux-next@lfdr.de>; Wed,  6 Mar 2024 04:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15731759F;
	Wed,  6 Mar 2024 04:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VR1/AVM4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8833012E78
	for <linux-next@vger.kernel.org>; Wed,  6 Mar 2024 04:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709700482; cv=none; b=ELEkXJtENuUQ076d4sKyvej9MdKWoJ+9v7xAkHXyJEtTeiPcIZ8IPveivpJ7hoqyesfqmNUIvGWf4B8FuQ3wYDWtKp8CIgYkEJ2Rs6X+2OgnjEF69BR4cd7+sGFMBKQV7nnqN9ApLNT/7xIC1I1pvGJLkt7h2d8QGV10vvnf4C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709700482; c=relaxed/simple;
	bh=tSAjs9eK7HDF/sYHpxTRhAOh0V/U4g9EmR+uAcjvDXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PbEAhwsh5bYtt1lPn1+rZ+tJuqie7qH5hMixMIdieqDhlkMn+Ii0FGsUpqFuc3vsS527Qe5hDRYgZYSO27QhR4Q43H/mWl2efm6Gbc6QeAVpbsXC3tWafZENC4IS75mrvcdoqhlQ5Y1bEjJNs04dEXvykd0ukyaF+Fova7j9w6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VR1/AVM4; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a44f2d894b7so472832166b.1
        for <linux-next@vger.kernel.org>; Tue, 05 Mar 2024 20:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1709700479; x=1710305279; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g4CIdjZYesrl7XFeEbdapJDS4EOgCD8lVZBp8CLgu4c=;
        b=VR1/AVM4HJjBVLVWRIl14RVOoF1YZ4Sq62bN77ru+1jNowp5POYnYXlzdl2ShxzWIT
         cV1MAoze+iLRswEggKimz/S0iW3lcwajsgt74wjDmkcigOFMk2s1IFIhTR/opHOHMBKx
         oPJGEG4Pgc6iXaaFp7kE/zcW/5dvfW6k2hqI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709700479; x=1710305279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4CIdjZYesrl7XFeEbdapJDS4EOgCD8lVZBp8CLgu4c=;
        b=X4tgwL0OMMAE7cMw5xiGkBaIMCLJ6+usjDbCnDN5QxZh748LIerLvaEfiJJ5YqXXC2
         UoWrXvgdEf83qNMGvJKoPHdrpTRAvlp6MDmtXwpfEePBBowmqqHCkrSMa+fYkxE2BUzP
         2JirSzxhLF/sIiqmEOSZ8T5BcaRJtSDeH894mDdlkpGCWCPye2LMlYpkh4gSfM72CfZE
         5YHQPzehyR5cUj2T3fwH+IF1ATiHIhs8zDrALVrpwGoxiRYduzg7ADGSjV8V1ytK5S1L
         Tt3bJhhAPM4fjeI6NizgFnyOSHR0qHHiiv59m+MF0zQL7i7309u3jl9ZPAlGLznwfXlG
         N8eA==
X-Forwarded-Encrypted: i=1; AJvYcCUYCRIptIr1/lyB3F4n794u9pDw0LIKcWj9FRun+xVnCUN7kGkvLSvU+vg7HGrWktEHGX+Sj86EN1t9YqE/bubwMQiieqTTHOhZ5A==
X-Gm-Message-State: AOJu0YzWImB2a9qYB8M+O7qaNz5BgoX8vpJHGq8Fa+HL31eiRZnIxRlL
	VfbJt6UiKUjCFDjRvaf/Rx0EgCCwr20FnH+BrGNtsZF3k//NZd9vM6iiiKOf4CcTW+EQXbM0QAj
	5j2WzPw==
X-Google-Smtp-Source: AGHT+IGz3eKioeKIoL4v73EHs2AqJfMMJaNvfKSTSaYEa+wSjuktKEIGlx6W7eZpzmyLq27eCavI8Q==
X-Received: by 2002:a17:906:c7c3:b0:a3f:1b49:c92b with SMTP id dc3-20020a170906c7c300b00a3f1b49c92bmr10201738ejb.48.1709700477853;
        Tue, 05 Mar 2024 20:47:57 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id w9-20020a1709064a0900b00a44f0d99d58sm4275482eju.208.2024.03.05.20.47.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 20:47:57 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a44cdb2d3a6so547245366b.2
        for <linux-next@vger.kernel.org>; Tue, 05 Mar 2024 20:47:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkvFMZdfkwzAVLApDZUZO5/UwtXQ3fuYX1IBzt0Dk7SGz8yhZIDSk8luHm5rZHIN1Z3TrV3vJ3KCB1uo0SVryn9cqKi88XPh1PCg==
X-Received: by 2002:a17:907:367:b0:a44:47e3:839b with SMTP id
 rs7-20020a170907036700b00a4447e3839bmr10781091ejb.10.1709700476605; Tue, 05
 Mar 2024 20:47:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306105150.06a456da@canb.auug.org.au> <CAHk-=whdTCEDaUPTMHUQXPQHuM8dhBi8yWbNAL11yE_ODqR_uA@mail.gmail.com>
 <20240306153703.499661d2@canb.auug.org.au>
In-Reply-To: <20240306153703.499661d2@canb.auug.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 5 Mar 2024 20:47:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiJLeR6tPcEmiRndhVtrPex0WavrFZ0UZHGjABVc=Tq1w@mail.gmail.com>
Message-ID: <CAHk-=wiJLeR6tPcEmiRndhVtrPex0WavrFZ0UZHGjABVc=Tq1w@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Tong Tiangen <tongtiangen@huawei.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Mar 2024 at 20:37, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> +static struct page *dump_page_copy(struct page *src, struct page *dst)
> +{
> +        return NULL;
> +}

No, it needs to be "return src;" not NULL.

That

  #define dump_page_copy(src, dst) ((dst), (src))

was supposed to be a "use 'dst', return 'src'" macro, and is correct
as that. The problem - as you noticed - is that it causes that "left
side of comma expression has no effect" warning.

(Technically it *does* have an effect - exactly the "argument is used"
one - but the compiler warning does make sense).

Actually, the simplest thing to do is probably just

  #define dump_page_free(x) ((void)(x))
  #define dump_page_copy(src, dst) (src)

where the "use" of the 'dump_page' argument is that dump_page_free()
void cast, and dump_page_copy() simply doesn't need to use it at all.

Christian?

            Linus

