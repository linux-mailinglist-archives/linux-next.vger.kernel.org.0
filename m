Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A99304C7DF7
	for <lists+linux-next@lfdr.de>; Tue,  1 Mar 2022 00:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiB1XGg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Feb 2022 18:06:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiB1XGf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Feb 2022 18:06:35 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECDE1DA64
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 15:05:56 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 12so12889069pgd.0
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 15:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5XfLtaVhc3U2s4Z+KCOJW64Bslbea+m3CHmZQC29sXU=;
        b=PHxWKin9lWphNRkfjtvM7b7NFZQfFiSnesxGZEMlv42pl16Jdwbx0ChWgMyGPyOWpI
         NpkmDQ9ouZJJqF95euLqr0PDjFBOPDHHqmZA5ZdE52wiQqidT1faw8eSJzLyH0Eiefko
         HAwNj2fbMlBWNZzH03LCQOiHv0Z3u6ytKpjN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5XfLtaVhc3U2s4Z+KCOJW64Bslbea+m3CHmZQC29sXU=;
        b=CGOJGSvNno/4zYPk+JEPii2B+P2qk513fEqomCObB6XzbrqYT2/tWlcAk29sgM15oo
         4lRe4iJt0eT8giNRX36LALsmIXwXtQpPLHZS0Fa0zdDZsiLQEIq6eSNDpIRONdQkDEUO
         sF2WrzrDx8QLm5xxz9RKTE4/0uhbjnBdH+KHBiqIufY+Ag7ZgVMXt0VvGyNWBCxmOolh
         0cM1VsYpqHSkW4ixQawNBiX0wshnr4/T2r9cHAR0hiMKOPr7aeRTfH0XP0hIXU5X2L6R
         pCIc07iC5fjHHD0QBZM1pSI5GzPcV7HitpWeG4PgCGutfRBv9TfptBaGqmD8/b1jTCUv
         5vMw==
X-Gm-Message-State: AOAM530eXAa8hIy7UcQSJTfNWRQtEcN1x3mIAaZVsTwYJWpVJLpv69vH
        XNkYgi1D702VBBBjFpdEF1Xx+hAMImqLkQ==
X-Google-Smtp-Source: ABdhPJz8acB2eEI43//DePXV6hL1QLI7S0Z3DNaNH+Qt6HaSe6jOBS8fKmIrBu1wCI+yqjTpRuclrQ==
X-Received: by 2002:a63:64a:0:b0:36c:6d40:5688 with SMTP id 71-20020a63064a000000b0036c6d405688mr19204435pgg.554.1646089555653;
        Mon, 28 Feb 2022 15:05:55 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q14-20020a056a00150e00b004f1252a21casm14609978pfu.161.2022.02.28.15.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 15:05:54 -0800 (PST)
Date:   Mon, 28 Feb 2022 15:05:54 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-next@vger.kernel.org
Subject: Re: change to Next/SHA1s ?
Message-ID: <202202281503.6D247902@keescook>
References: <202202281042.733E768F@keescook>
 <20220301094644.58360917@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301094644.58360917@canb.auug.org.au>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 01, 2022 at 09:46:44AM +1100, Stephen Rothwell wrote:
> Hi Kees,
> 
> On Mon, 28 Feb 2022 10:43:37 -0800 Kees Cook <keescook@chromium.org> wrote:
> >
> > I was curious if it might be possible to emit the commit date along with
> > the tree/SHA1 map in Next/SHA1s? That would let people trivially scan
> > the file for relative age of trees, etc.
> 
> Of course it is possible :-)  Just wondering what the use case is?  It
> does make it a bit harder to read (wider lines).

My use case is that I find myself with some frequency looking at "git
show next-YYYYMMDD" to see the trees to see what date a given tree is on
(some update frequently, some don't, etc).

> while read tree sha; do
> 	if [ "$tree" = 'Name' ] || [ "$tree" = '----' ]; then
> 		printf '%s\t%s\n' "$tree" "$sha"
> 	else
> 		git log -1 --date=iso-strict-local --pretty="$tree	$sha %cd" "$sha"
> 	fi
> done <Next/SHA1s

Right, I can do it manually, but I was wondering if such a change would
be useful to others, or troublesome, etc. :) I can live without it, for
sure; I just thought I'd ask. :)

-- 
Kees Cook
