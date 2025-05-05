Return-Path: <linux-next+bounces-6517-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE4EAA8CEB
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 09:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56F61188EB83
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 07:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28DA1ACEAC;
	Mon,  5 May 2025 07:21:31 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679214B965;
	Mon,  5 May 2025 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746429691; cv=none; b=L+8cLYlAGO9ExmSQvtDz+7jho5sWwcjLpcQQS6M09emF41zM1DbU8NLT/M0HEmW9f2IyqNv6sSGD098C01Ii3FXxK/qENTx0l3WjIsKVYq1+4fwKmUSK0M/7u+aqUQwBbW2Ly7NK/ovcpA4oDYxii1aWbkegS3Pfw+LFOdaujVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746429691; c=relaxed/simple;
	bh=9uFZoV3PpCUETRaPKf7nDphlzzExlnttykCSW+wfLKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvz4I/jwuUIiR6gJKp7APNjHYhGyXHGDy7TKEYAeeyNUwfvkWqsmInmQNohW/wCnXBm69yc00jtL/ITGg7DqEgUKrzLaLQ7EsmirVONLdFZ2AY8+4sk1T7F9mrusG9cUx4eCs8MvWSSD9WRM+BHeSgRrpA6VekmIVbSwhfUXlWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86715793b1fso984665241.0;
        Mon, 05 May 2025 00:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746429688; x=1747034488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTcqx3y1Zv7wXrZGjPmDovC5D6K+j6ESgW83IpDDNQQ=;
        b=Q6L6Wu7sYTdtYZ8zJYS06JMdEfjjmN6LaOiExh9KSvoR0cUdpAvyTPkbHe8tj9+Wha
         HXjvmgn4rUfRgWEIhfq7UzctUDZsZydjd+aNgj1uaRH9jHC8wRb0FW2G8rsBit2/iAXq
         F8aDoA9NdcsjfpPge8X4Capo3r0OX3tyg0UlP31dxkifkKPtd+hY6kbVaEG9zebyzMSH
         TDdbtc9a1cLKlbu/Id+GiNUh/m7eUOfr4NEwvUvgyMDg/HLD/A/7hF2741lWRdtXnbAK
         y551tOdZnFA4G93xqL8ZVSuEa/It84dFpQPKAyEu+/jaBxgVPIzf/nYoM5DFNjr81fEP
         E8FA==
X-Forwarded-Encrypted: i=1; AJvYcCWncPIL7lpBonspuhdzl1MrCO1TlJjiVW1K52OIhUWzCABbV8NhuK2dNly71mGWXMLQ5+Zydwlutqghgg==@vger.kernel.org, AJvYcCWo97Qn4FaHsEAKalikVx/1LshCOjFe3kT8cM5gyb7ox1G8y6thjcJxeaF3EX8+y24gUirsfsRPS5G8AL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv23SCY70hpSyTERIu8+A9soBrgVeAhvjz1J9yacLcRN6zYuOd
	n9J6diLFMT3qsQC1MiuchhN6qRjYrjWiyO4Hvyw4gnQjuQOiXBQtOEyZ1SG/
X-Gm-Gg: ASbGncvj3kz/tR+8xlTNL97ZkBWxD14AZbhaphd2T4SjcxLGCJsTRb0PC3LcsdeWOqB
	b74IXhlxEE/11qldBkumZF9FupQPtCvVjU1OyyJzlwGueEWrp9tOUWk1Xa+WIskAUNAboCTxWZ0
	kBbzCx1Y7TaHn513Gn8v6SQvTDOoB8l7yuGXPGE1Dg4SlqQ+sgJSnGHIuG7Z6BD5cgusrDW4Ydd
	wsv2JSgr8Dk8WD6Sxj0Gki5p6TmvP6zRc754qdYgsX1te1N99beUm8RSBKNSap8J3eqke8knUT9
	1xRKg7TvctroSkz1XXP9s1PTVTLDMklmzvKaYTytSK1BfHBQuC55C/b8+owOJev28CHtPBxtlMp
	JyeQ=
X-Google-Smtp-Source: AGHT+IEwBxkQfwmjeEsEwT7lsjw85js0L3qfu6ljwpKNa8AK/o5Hs+e7LycJzQqHySMuG6V+OFxl4g==
X-Received: by 2002:a05:6102:4b18:b0:4c1:774b:3f7a with SMTP id ada2fe7eead31-4db149174d0mr2435354137.16.1746429688168;
        Mon, 05 May 2025 00:21:28 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4daf26062b0sm1304781137.19.2025.05.05.00.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 00:21:28 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-877c48657f9so662113241.1;
        Mon, 05 May 2025 00:21:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOFMo6swkwkW9X6zDHDlV1OgFWUbkjfZHe23YWq9l66FoAySA/1KG4Qf181u6QKjpLyi3DOcP4U+FLWhc=@vger.kernel.org, AJvYcCUoRgrZ/bMhYL88pg09bkmovsmIIqdn63cBdL9OSsP+lvpltEBOhS4QSyFxGxlpXJ14MWSWT6esRz6/1Q==@vger.kernel.org
X-Received: by 2002:a05:6102:2c02:b0:4c4:e018:326f with SMTP id
 ada2fe7eead31-4db147cc599mr2885872137.10.1746429687842; Mon, 05 May 2025
 00:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-misc-test-fixup-v1-1-6f39ed6c733d@igalia.com>
In-Reply-To: <20250430-misc-test-fixup-v1-1-6f39ed6c733d@igalia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 09:21:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUk4UqmZV9zyzRz3S6n6+6vRQOcFymR_5J1A=JxAXUsSw@mail.gmail.com>
X-Gm-Features: ATxdqUHvcAtG0So1qYVnS8CrzGCWjt_LpzMvW1LAaPVMH4RFAZw14bvBUN7h9d4
Message-ID: <CAMuHMdUk4UqmZV9zyzRz3S6n6+6vRQOcFymR_5J1A=JxAXUsSw@mail.gmail.com>
Subject: Re: [PATCH] char: misc: make miscdevice unit test built-in only
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, kernel-dev@igalia.com, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Thadeu,

On Wed, 30 Apr 2025 at 18:53, Thadeu Lima de Souza Cascardo
<cascardo@igalia.com> wrote:
> Since it uses __init symbols, it cannot be a module. Builds with
> CONFIG_TEST_MISC_MINOR=m will fail with:
>
> ERROR: modpost: "init_mknod" [drivers/misc/misc_minor_kunit.ko] undefined!
> ERROR: modpost: "init_unlink" [drivers/misc/misc_minor_kunit.ko] undefined!
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250429155404.2b6fe5b1@canb.auug.org.au/
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504160338.BjUL3Owb-lkp@intel.com/
> Fixes: 45f0de4f8dc3 ("char: misc: add test cases")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

Thanks for your patch, which is now commit 20acf4dd46e4c090 ("char:
misc: make miscdevice unit test built-in only") in char-misc-next.

> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2512,7 +2512,7 @@ config TEST_IDA
>         tristate "Perform selftest on IDA functions"
>
>  config TEST_MISC_MINOR
> -       tristate "miscdevice KUnit test" if !KUNIT_ALL_TESTS
> +       bool "miscdevice KUnit test" if !KUNIT_ALL_TESTS
>         depends on KUNIT
>         default KUNIT_ALL_TESTS

This means "default y" if KUNIT_ALL_TESTS=m, which is IMHO not
what we want.

Perhaps

    default KUNIT_ALL_TESTS=y

?

>         help


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

