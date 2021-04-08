Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C418A357DA4
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 09:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbhDHHwQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 03:52:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34726 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229552AbhDHHwQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 03:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617868325;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H58uU+VyGQGX8F+tsLBzPKkX41NF14uglhKP8Fct0B8=;
        b=Axt7H+Ks49JEyxpvxuylHwgY+rKe5D9g4V1MeOZZpVx+5KW/nOmLm8kvgj/s5VDZbDQlu+
        ouo9pzeyjCQq7TVp3YDdOZK2dMkP5GPVDxQZTUqA3lxuJSEvWYket2I47A3P6KXq/ZLgtT
        bo9VjdAxvqjqyXrNxLdD/OQnI+jS1yM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-CnwbICDGMp-jlvq2Doqbqg-1; Thu, 08 Apr 2021 03:52:02 -0400
X-MC-Unique: CnwbICDGMp-jlvq2Doqbqg-1
Received: by mail-ej1-f72.google.com with SMTP id di5so478572ejc.1
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 00:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=H58uU+VyGQGX8F+tsLBzPKkX41NF14uglhKP8Fct0B8=;
        b=hZ1Bpjlu9H2gi6iH/TBuqAm9GqNqZPuCekDA9fQn12Ez7c8S5QMq8qxkksK+MTV/uv
         2cSZCLcxctcLPaOG3npf+8DKYh1xoRGMD5jPRgbGl9Mo/j+FI7KMV7q3WxCEmE3DT48i
         jhdb5hGYpkRcPWTCzrJwHquhwJLdpZYYaBx9kJcppyePm2C0gVwLQV/84pJYuQnLjuDv
         FJfRat7e+PywN9MbG6MR53gGU9WtuYBBAEGE6C8/jYDOim/DLx12NTOjgquAsmEZMzbv
         D1ZFe0kMpgX8MTNl80nJZ5Bg16e0kogUa7RgGE7F9HQ3U+YwAs7IMPBzEyB/XHzuAIgk
         WXQQ==
X-Gm-Message-State: AOAM5311OhN+f2i2mRTCTFoAxLzT6vrpssqyWoiuErHWLDIOrdxcmmwz
        0s6FT4rHfwVhaLwuXibMc/QSvJxLdZ6z15EXtvYw51Q9JeCy8RYbhpLIEstlyBBMoevvpbOaxfe
        Adpp/kKBo2r9bfyGlNYOdyw==
X-Received: by 2002:a17:906:2710:: with SMTP id z16mr8676005ejc.176.1617868321512;
        Thu, 08 Apr 2021 00:52:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx40NhaN1xYNuVVALA7D7BrRd/i6hx0VscNnkGed+hN1RYSJT1/OKpgHzEL9Cpv8Cmbmbv2kg==
X-Received: by 2002:a17:906:2710:: with SMTP id z16mr8675994ejc.176.1617868321367;
        Thu, 08 Apr 2021 00:52:01 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id lj21sm3592377ejb.64.2021.04.08.00.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 00:52:01 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the pm tree
In-Reply-To: <20210408083836.39c4063a@canb.auug.org.au>
References: <20210408083836.39c4063a@canb.auug.org.au>
Date:   Thu, 08 Apr 2021 09:52:00 +0200
Message-ID: <87zgy9b4db.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> In commit
>
>   fa26d0c778b4 ("ACPI: processor: Fix build when CONFIG_ACPI_PROCESSOR=m")
>
> Fixes tag
>
>   Fixes: 8cdddd182bd7 ("CPI: processor: Fix CPU0 wakeup in acpi_idle_play_dead()")

"A" in "ACPI" seems to be missing

>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

This is an extremely unlucky fix :-( 

-- 
Vitaly

