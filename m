Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27E83A22E2
	for <lists+linux-next@lfdr.de>; Thu, 10 Jun 2021 05:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhFJDmD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Jun 2021 23:42:03 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:35679 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbhFJDmD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Jun 2021 23:42:03 -0400
Received: by mail-oi1-f177.google.com with SMTP id v22so617887oic.2;
        Wed, 09 Jun 2021 20:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5HqTtvnjgs8LV6/Eiaxmfm771gbJrl9vBDQXUTj1jtk=;
        b=Ux8AnCFpquQZ8Jymy04wV/j2arex3m3S2FnI9Y2XUysjMDqOiqhr9f9iAOFQxgili7
         1HGHtgGkXn+zvkZ57u8e9pD5ypElvX/KT94tuBohfpt/K4kTpkhgI+Wq+K4N5EQ5I1Pl
         RSerk+XppRx5POcxKi/PtTGlEwftdJFAt3aT2WTZKGlwA+8exGFXkbC1I01aqiUKW6xR
         Z1+VIqb7ks3l/eoKk+9m+0XprkE3r4sVsAQ/mrT0n5MIduDrmBc+gWjytYva+VSGc+0e
         b4O3YTzCetq6i2Q42knoJDNt6O3z0BTI5JRieqXI/RRpjoAPoLwQ5fMZfytJ1yIdpCbV
         4MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=5HqTtvnjgs8LV6/Eiaxmfm771gbJrl9vBDQXUTj1jtk=;
        b=NyLtT9ml53WOxvApKyd7P7wyacOC1qjKsru7f1/fV9Uo1+/MdxZPLa09bD/ulohsNG
         b7WZYWwQ2U05LV+kcLGUamvjhjH1MdbRABJjUusAvO8CAqPQtIuwVFF8ayWeMMW4E7er
         NO8FXEcqp2j09bq16rQ3QUM2kTdzQsy48B2ha2uFMLDw2VHbA2DpxEDWtGWTuIx1Amkj
         juAy7/8EiaGKVrqncoOMVWI0HhAiAR3f8xtgECkhc2+PrndMGka3kbQcg9DZzrB5MeWV
         LGCBv/H8dYG/4aKuAq+2V+ykgeC1KPifHHSKGOjtt7eCpanCAegGGbODtO9qGBou+pvB
         zJ8Q==
X-Gm-Message-State: AOAM531EwGc7Ll3/hucQ3xi/7RoSQMpEhU1OI1JmVE9rtRKZi9kcQI2D
        3Tvy8DW/QUOkCwkFOl1ckGn0KaABJQs=
X-Google-Smtp-Source: ABdhPJw6G5hM4NiLD377Tr6qq0E2+2d54yZfaPWbckGA4GZpLj2d8Uym3H1absxwLsA5nJlXAfgRgA==
X-Received: by 2002:a54:4385:: with SMTP id u5mr1949535oiv.30.1623296332921;
        Wed, 09 Jun 2021 20:38:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m23sm401359otk.55.2021.06.09.20.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 20:38:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 9 Jun 2021 20:38:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20210610033850.GA2542657@roeck-us.net>
References: <20210610102117.4881387a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610102117.4881387a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 10, 2021 at 10:21:17AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hwmon-staging tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: modpost: module dps920ab uses symbol pmbus_get_debugfs_dir from namespace PMBUS, but does not import it.
> WARNING: modpost: module dps920ab uses symbol pmbus_do_probe from namespace PMBUS, but does not import it.
> WARNING: modpost: module dps920ab uses symbol pmbus_read_word_data from namespace PMBUS, but does not import it.
> WARNING: modpost: module dps920ab uses symbol pmbus_write_word_data from namespace PMBUS, but does not import it.
> 
> Introduced by commit
> 
>   47e986c5a316 ("hwmon: (pmbus) Add driver for Delta DPS-920AB PSU")

Fixed.

Thanks,
Guenter

> 
> -- 
> Cheers,
> Stephen Rothwell


