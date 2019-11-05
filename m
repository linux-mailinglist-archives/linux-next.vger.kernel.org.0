Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97E04F03DB
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 18:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbfKERMV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 12:12:21 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39579 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728399AbfKERMU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 12:12:20 -0500
Received: by mail-pf1-f194.google.com with SMTP id x28so12798166pfo.6
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2019 09:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+aBY/thMg34NWbir5O0tU6poYANFaLQynRGPj7hCMkU=;
        b=Ju6VvhrSAq89eAvushZ9rax2OZHyxoAlVgKoioVaVUqvLfRYZJyIVKb0exX7RSC0PG
         445xtUjrqLqDMcazlVz67e3GfavaeRypeLVF9IvInWi7CDcJLJx9ASoE0Vqlj45ewVe+
         Do0qtoAf0Ip/FUuyJCDqf6B8TBRsl2KkgyHGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+aBY/thMg34NWbir5O0tU6poYANFaLQynRGPj7hCMkU=;
        b=N9QL0sIuMeZRyel96BcjrmBPaMda/HlDqWG66K428uGsS/GBU2+d0x5rcUDJV9peq6
         Hnqx1Ed+Peq/mzySlbV3j+NWWiajLD6nw5ad3Nj3POjKWccbFaSK0Fu/Z+aHUpQt0EUL
         Bb3FHamg9e1fdpwbyBr22zEtZO9Cv9OWQ2MPHN/OoaXMeeXIUWVu3YdpL4aSj4dOWOhz
         8r3N1KW+MkgdHAgildYM9Asj3Wf6Dq65b+QMrv2qBL1vw0iIy6cemcUyyiVn1O39EJ/X
         NFX8mpPW/rbsnxL3sqGgliq2I8HJxDdoIt7oslLJ32RG++A1HDaaSpgZYkkGxYQFS+/V
         WA3A==
X-Gm-Message-State: APjAAAW2iGUlNUznBlWcFObQQF+PMiK/DNOKPK7W/POYG21Tcud8f8+b
        5SpKVKO7a7YsQbZWrjwVqI0Ecs2J16E=
X-Google-Smtp-Source: APXvYqxxCm0LN6nmXy3M5bY6vS0pLw+CVxxpdeCG4DTsaCsEiG7glFfXBXx1MbxJhNphAfCfPIgagA==
X-Received: by 2002:a63:eb08:: with SMTP id t8mr38770365pgh.49.1572973940079;
        Tue, 05 Nov 2019 09:12:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l93sm23375pjb.6.2019.11.05.09.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 09:12:19 -0800 (PST)
Date:   Tue, 5 Nov 2019 09:12:18 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Ajay.Kathat@microchip.com
Cc:     gregkh@linuxfoundation.org, gustavo@embeddedor.com,
        linux-next@vger.kernel.org, Adham.Abozaeid@microchip.com
Subject: Re: Coverity: wilc_parse_join_bss_param(): Memory - illegal accesses
Message-ID: <201911050911.E5A34776F3@keescook>
References: <201911040938.57CCE1B@keescook>
 <ce212f1d-e04d-6c95-ff18-2ddbed982bd9@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce212f1d-e04d-6c95-ff18-2ddbed982bd9@microchip.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 05, 2019 at 06:11:03AM +0000, Ajay.Kathat@microchip.com wrote:
> 
> 
> On 04-Nov-19 11:08 PM, coverity-bot wrote:
> > External E-Mail
> > 
> > 
> > Hello!
> > 
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191031 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> > 
> > 4e0b0f42c9c7 ("staging: wilc1000: use struct to pack join parameters for FW")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1487400:  Memory - illegal accesses  (OVERRUN)
> > /drivers/staging/wilc1000/wilc_hif.c: 496 in wilc_parse_join_bss_param()
> > 490     	if (supp_rates_ie) {
> > 491     		if (supp_rates_ie[1] > (WILC_MAX_RATES_SUPPORTED - rates_len))
> > 492     			param->supp_rates[0] = WILC_MAX_RATES_SUPPORTED;
> > 493     		else
> > 494     			param->supp_rates[0] += supp_rates_ie[1];
> > 495
> > vvv     CID 1487400:  Memory - illegal accesses  (OVERRUN)
> > vvv     Overrunning array of 13 bytes at byte offset 13 by dereferencing pointer "&param->supp_rates[rates_len + 1]". [Note: The source code implementation of the function has been overridden by a builtin model.]
> > 496     		memcpy(&param->supp_rates[rates_len + 1], supp_rates_ie + 2,
> > 497     		       (param->supp_rates[0] - rates_len));
> 
> As I understand, Ideally this condition should never arise because the
> maximum number of supported *basic rates* is up to 8 so the value of
> ‘rate_len’ will always be less then WILC_MAX_RATES_SUPPPRTED (i.e 12).
> Therefore '&param->supp_rates[rates_len+ 1]' will never try to access
> the 13 bytes in the array.
> But for the safer side, if need I can create a patch to block the
> addition of extended supported rates in ‘param->supp_rates’ array if
> ‘rates_len’ is 12 (i.e 'param->supp_rates' array is full after filing
> the basic supported rates).

I don't know the code myself, but generally speaking, it's best to
validate any assumptions like this. I'd say add a patch for it, since it
sounds pretty straight-forward to test.

-Kees

> 
> > 498     	}
> > 499
> > 500     	ht_ie = cfg80211_find_ie(WLAN_EID_HT_CAPABILITY, ies->data, ies->len);
> > 501     	if (ht_ie)
> > 
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include these lines (but double-check the "Fixes" first):
> > 
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1487400 ("Memory - illegal accesses")
> > Fixes: 4e0b0f42c9c7 ("staging: wilc1000: use struct to pack join parameters for FW")
> > 
> > 
> > Thanks for your attention!
> > 

-- 
Kees Cook
