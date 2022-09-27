Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9E805ECCD8
	for <lists+linux-next@lfdr.de>; Tue, 27 Sep 2022 21:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbiI0T2X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Sep 2022 15:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbiI0T2U (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2022 15:28:20 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC6DFE04A
        for <linux-next@vger.kernel.org>; Tue, 27 Sep 2022 12:28:16 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id f23so9964353plr.6
        for <linux-next@vger.kernel.org>; Tue, 27 Sep 2022 12:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=2vIlmRIaSFKVhbMSXUDbGTwH2ZL5cAhKOprBdk28COM=;
        b=LtBv2hgImbBRE2IHyWvV7U2Vujg6OqGxgmF8zAs4hZ72OrEPuN8NZo+fHCaTxGt1FR
         KLmEIbu0cNNdb6MH2qlAZUlF8ISsYdV0/prhnsC5VeA7tOWio4IzhXtL3o3347bdizLN
         GLkz2IXwvFQKd7zxDEUmcoru7EZHXxYm38jrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2vIlmRIaSFKVhbMSXUDbGTwH2ZL5cAhKOprBdk28COM=;
        b=NqXClarcdmcIiC6E/1GDUWDvmjsVhQSKUqjfY2pmL9GLUguCvbVeeD2srSaalf2GfP
         QVYOaIQ84wxsyt88a4Nvaj6iiibbPt7kVEKzp2xY2FvB1ATAob9plZgsQHsJSQYhS/DV
         kFfx5/wAExXM+jxSDEq70Gtd0xgNYZkDSxq/LPkJnpgzGQxbP1dMKulpV3YRojKQlKwH
         MmB18U9Qy6EG+Vh+1HN5utvZFTT5mJhF0APW4nEg3ubowpf9xVh6kKFxgyOvsx6Bnc0d
         RiuQk4pU1YMWez+dC7lCOU2U/Lbw3Dh37QIZRQDgdITKWNQDr+GCiYn5Pm8NMH2/rjfw
         lBhA==
X-Gm-Message-State: ACrzQf2Zk4JncBju7GVmMm/Wn8plqM4vaE2xKTAS3fWkSh4gR1YHP03P
        SBYzp/ECSqNqtSW/vHX6zkuV5sEgmAnE4g==
X-Google-Smtp-Source: AMsMyM7hdvfrb/03VEy/Sd5wxxecM0ux5EB/mWeA47BvYBAlAuTGnqHb2bTiiru+GYaFeTOTJBK9SQ==
X-Received: by 2002:a17:90b:4c84:b0:203:20a:7afe with SMTP id my4-20020a17090b4c8400b00203020a7afemr6188098pjb.94.1664306895499;
        Tue, 27 Sep 2022 12:28:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b6-20020a17090a8c8600b00202d1745014sm1713023pjo.31.2022.09.27.12.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 12:28:14 -0700 (PDT)
Date:   Tue, 27 Sep 2022 12:28:13 -0700
From:   Kees Cook <keescook@chromium.org>
To:     broonie@kernel.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: linux-next: manual merge of the kspp tree with the arm64 tree
Message-ID: <202209271228.00C60FE98@keescook>
References: <20220927185911.512737-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927185911.512737-1-broonie@kernel.org>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 27, 2022 at 07:59:11PM +0100, broonie@kernel.org wrote:
> Hi all,
> 
> Today's linux-next merge of the kspp tree got a conflict in:
> 
>   arch/arm64/kernel/alternative.c
> 
> between commit:
> 
>   b723edf3a12a2 ("arm64: alternatives: make alt_region const")
> 
> from the arm64 tree and commit:
> 
>   5f20997c194e8 ("arm64: Drop unneeded __nocfi attributes")
> 
> from the kspp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc arch/arm64/kernel/alternative.c
> index 64045e3ef03a9,d2c66507398d7..0000000000000
> --- a/arch/arm64/kernel/alternative.c
> +++ b/arch/arm64/kernel/alternative.c
> @@@ -139,9 -133,8 +139,9 @@@ static void clean_dcache_range_nopatch(
>   	} while (cur += d_size, cur < end);
>   }
>   
> - static void __nocfi __apply_alternatives(const struct alt_region *region,
> - 					 bool is_module,
> - 					 unsigned long *feature_mask)
>  -static void __apply_alternatives(struct alt_region *region, bool is_module,
> ++static void __apply_alternatives(const struct alt_region *region,
> ++				 bool is_module,
> + 				 unsigned long *feature_mask)
>   {
>   	struct alt_instr *alt;
>   	__le32 *origptr, *updptr;

Thanks! Yes, this looks correct.

-- 
Kees Cook
