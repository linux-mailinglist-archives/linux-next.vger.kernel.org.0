Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDFB39FE22
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 19:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233870AbhFHRuX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 13:50:23 -0400
Received: from mail-pf1-f180.google.com ([209.85.210.180]:36783 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233156AbhFHRuW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 13:50:22 -0400
Received: by mail-pf1-f180.google.com with SMTP id c12so16317866pfl.3
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 10:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=+HXWQ4xWQk30SS0CRGMtNl/MaCaNInHPgMd25EtPsT8=;
        b=Ldsjm2p2uE61agoZyWG/eN2BzQEdqFbugj4FXI7DtdtH/qbs0aFXWh8N6apzUA16sE
         PGIfexSPt5PN6sCF1SvkFebd4VTdT0ICjq5jxS8XC2aBa2zj2QtX7VSY6jNcdFiSa8xR
         afwYsp4IZ9WvTfu75FlH6c3cT1r11dv+DTIYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=+HXWQ4xWQk30SS0CRGMtNl/MaCaNInHPgMd25EtPsT8=;
        b=tj/rPEvHp5W3MlZy3RuLu8i82ZWpJn+NqorNNovctbtoPsLkoewtXAwaQpJgneyKHR
         YGuV5Y63+4UI+NU4Dxo02Rk09AVF7MgyLEwS0IPBx73qJDGuBV0XOX7fbKqg3dL8DX9+
         6MPhu1/pdZ6l/mW2Zb0RkrtHH1ngG6UgFIQzwqdGUrpqxcuVsZ5e95gpTfAaDHQNpEaY
         TYX3BYNypyoehhmsy9byU8Ic7w5QElvRtV5PrYc2oRwI/5FWeWdqUvvBLw0we2b1YP2l
         umnFg3HplDPrOxAe4O64BTmt6Cl2HBqWSCm1oPz3tlsvn46YpUWvtiTN1gqgDLTrweAg
         3edQ==
X-Gm-Message-State: AOAM533zcZmvKJqG/kVE1O9OHRDEDUJ/Xpv4wJ4EHTUQ4Mfqj2PDLcvK
        NGoC9eTIV+fEeMhtAsKkyWsKqA==
X-Google-Smtp-Source: ABdhPJwuVOhxfAmQXKoD/2p+hM2HELa3R5VcJMaXTEkObJWvEEj6DEXBZA7rAUGMOylexg59SS6QVw==
X-Received: by 2002:a65:5a47:: with SMTP id z7mr23982354pgs.400.1623174439091;
        Tue, 08 Jun 2021 10:47:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 21sm10929501pfh.103.2021.06.08.10.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 10:47:18 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 8 Jun 2021 10:47:17 -0700
To:     Florian Westphal <fw@strlen.de>
Cc:     Pablo Neira Ayuso <pablo@netfilter.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: nf_tables_addchain(): Memory - corruptions
Message-ID: <202106081047.A1AA0551EB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210608 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Jun 7 12:23:38 2021 +0200
    7b4b2fa37587 ("netfilter: annotate nf_tables base hook ops")

Coverity reported the following:

*** CID 1505166:  Memory - corruptions  (UNINIT)
/net/netfilter/nf_tables_api.c: 2188 in nf_tables_addchain()
2182     		err = PTR_ERR(trans);
2183     		goto err_unregister_hook;
2184     	}
2185
2186     	nft_trans_chain_policy(trans) = NFT_CHAIN_POLICY_UNSET;
2187     	if (nft_is_base_chain(chain)) {
vvv     CID 1505166:  Memory - corruptions  (UNINIT)
vvv     Using uninitialized value "basechain".
2188     		basechain->ops.hook_ops_type = NF_HOOK_OP_NF_TABLES;
2189     		nft_trans_chain_policy(trans) = policy;
2190     	}
2191
2192     	err = nft_chain_add(table, chain);
2193     	if (err < 0) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505166 ("Memory - corruptions")
Fixes: 7b4b2fa37587 ("netfilter: annotate nf_tables base hook ops")

Thanks for your attention!

-- 
Coverity-bot
