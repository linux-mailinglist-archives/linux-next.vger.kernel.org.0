Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECAD72F856
	for <lists+linux-next@lfdr.de>; Wed, 14 Jun 2023 10:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243849AbjFNIvp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Jun 2023 04:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243786AbjFNIv1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Jun 2023 04:51:27 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB481FC7
        for <linux-next@vger.kernel.org>; Wed, 14 Jun 2023 01:51:19 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30aeee7c8a0so4808472f8f.1
        for <linux-next@vger.kernel.org>; Wed, 14 Jun 2023 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1686732678; x=1689324678;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csZv0c9LfeFqbw6cbCbu3ICvitJ0rl7602V3R2VsNxA=;
        b=y0xvs5zH3IfzGfS8Cqi45C7XpB8PYFCfAQK61jPGRE3yj7F9qeaXocXzJP9hochIRt
         FpAJFuSakonsiuvOaDM5hkJApquw3g8kzHAFe4sTksiO+6SDDyt/AHGSmDSLjDXwTuUt
         xyNnWdcrSWWa3Gp4FRLr+qmFxscwzA7nKfmD1SdX4YyiM4wq2vYWeZHkrQe1tGQ0Zx8P
         B0fIFWjY/cGY+ORGO80nZu8bFrOsNgr7UrEILVyU8yyrfaAoI304xprskGodnN7yUbDL
         hFo+/Ph4v94TMHyUNzD6uypMMTvoa1dL5hu6jwVB11ELkwo7TAoDWiceKhCcLHXfVftE
         fdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686732678; x=1689324678;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csZv0c9LfeFqbw6cbCbu3ICvitJ0rl7602V3R2VsNxA=;
        b=eZ9cuwRatVQpTZrRKz0T9FSbfZJke/gn+dGewmh9T4UYWApvPbx+bpolZx6muMFYuz
         JwLMy8nu4nU2E+z+yfoxGBNL0DAmoaXfMc2InPR6io6IKIGumfTI8BCV7re0s9kiuZHb
         ix9O8S5BjMl+ED6GrwcCQplsa5lY0guAyr+WXsexMboicUStZxE0agNzJnJwuLfsubyU
         HzE5E1uci49rdXJtZ5qfaKyyPETOojs4FgRqTpIJMO7jDpEPinc+sLGTebxfJ+DGSouD
         4qlgzUq27ehpo7ZDSliw2U/TkX4JwsV8aAds61x6iMVDvKtelyHS81lQ0lxekUKHHQYy
         Bntg==
X-Gm-Message-State: AC+VfDxsOV0AlhjBJWQaKbFxvlHEMwCwxL4HMa7OOSyV8RV0wUhmz/ge
        y3z8fS6tSPm+yNDeEi1UwK2hSQ==
X-Google-Smtp-Source: ACHHUZ7HWyC+8hqm8soJNvhVdmwmi6Hsvr6uxVCGpzyyBFM9Bcn+I0cxHlDDg0h52AzSzsre+piFlw==
X-Received: by 2002:a5d:4687:0:b0:30f:ba3a:85c5 with SMTP id u7-20020a5d4687000000b0030fba3a85c5mr906084wrq.25.1686732678069;
        Wed, 14 Jun 2023 01:51:18 -0700 (PDT)
Received: from ?IPV6:2a02:578:8593:1200:f189:66db:5060:b402? ([2a02:578:8593:1200:f189:66db:5060:b402])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d620e000000b0030ae4350212sm17657205wru.66.2023.06.14.01.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 01:51:17 -0700 (PDT)
Message-ID: <c473ffea-49c3-1c9c-b35c-cd3978369d0f@tessares.net>
Date:   Wed, 14 Jun 2023 10:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Content-Language: en-GB
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>
Cc:     Networking <netdev@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mat Martineau <martineau@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
References: <20230614111752.74207e28@canb.auug.org.au>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <20230614111752.74207e28@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 14/06/2023 03:17, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   tools/testing/selftests/net/mptcp/mptcp_join.sh
> 
> between commits:
> 
>   47867f0a7e83 ("selftests: mptcp: join: skip check if MIB counter not supported")
>   425ba803124b ("selftests: mptcp: join: support RM_ADDR for used endpoints or not")
> 
> from the net tree and commits:
> 
>   45b1a1227a7a ("mptcp: introduces more address related mibs")
>   0639fa230a21 ("selftests: mptcp: add explicit check for new mibs")
> 
> from the net-next tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you for the conflicts resolution. If I'm not mistaken, it looks
good except the last chunk where the new call to chk_rm_tx_nr() should
go inside the 'if' statement. So instead of this bit you have on your side:

> @@@ -2394,12 -2290,8 +2399,13 @@@ remove_tests(
>   		pm_nl_add_endpoint $ns2 10.0.4.2 flags subflow
>   		run_tests $ns1 $ns2 10.0.1.1 0 -8 -8 slow
>   		chk_join_nr 3 3 3
> + 		chk_rm_tx_nr 0
>  -		chk_rm_nr 0 3 simult
>  +
>  +		if mptcp_lib_kversion_ge 5.18; then
>  +			chk_rm_nr 0 3 simult
>  +		else
>  +			chk_rm_nr 3 3
>  +		fi
>   	fi
>   
>   	# addresses flush

We should have:

> @@@ -2394,12 -2290,8 +2399,13 @@@ remove_tests(
>   		pm_nl_add_endpoint $ns2 10.0.4.2 flags subflow
>   		run_tests $ns1 $ns2 10.0.1.1 0 -8 -8 slow
>   		chk_join_nr 3 3 3
>  -		chk_rm_tx_nr 0
>  -		chk_rm_nr 0 3 simult
>  +
>  +		if mptcp_lib_kversion_ge 5.18; then
> ++			chk_rm_tx_nr 0
>  +			chk_rm_nr 0 3 simult
>  +		else
>  +			chk_rm_nr 3 3
>  +		fi
>   	fi
>   
>   	# addresses flush

("chk_rm_tx_nr 0" needs to be inside the 'if')


I added a note about the conflicts on the cover-letter:


https://lore.kernel.org/netdev/20230609-upstream-net-20230610-mptcp-selftests-support-old-kernels-part-3-v1-0-2896fe2ee8a3@tessares.net/

Maybe it was not a good place? I didn't know where to put it as there
were multiple patches that were conflicting with each others even if the
major conflicts were between 47867f0a7e83 ("selftests: mptcp: join: skip
check if MIB counter not supported") and 0639fa230a21 ("selftests:
mptcp: add explicit check for new mibs"). I guess next time I should add
a comment referring to the cover-letter in the patches creating conflicts.

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
