Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AA93A04FE
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 22:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234243AbhFHUPT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 16:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbhFHUPT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 16:15:19 -0400
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:12e:520::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68DFC061787
        for <linux-next@vger.kernel.org>; Tue,  8 Jun 2021 13:13:25 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1lqi6F-0004gG-4o; Tue, 08 Jun 2021 22:13:23 +0200
Date:   Tue, 8 Jun 2021 22:13:23 +0200
From:   Florian Westphal <fw@strlen.de>
To:     coverity-bot <keescook@chromium.org>
Cc:     Florian Westphal <fw@strlen.de>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: nf_tables_addchain(): Memory - corruptions
Message-ID: <20210608201323.GJ20020@breakpoint.cc>
References: <202106081047.A1AA0551EB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106081047.A1AA0551EB@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

coverity-bot <keescook@chromium.org> wrote:
> 2186     	nft_trans_chain_policy(trans) = NFT_CHAIN_POLICY_UNSET;
> 2187     	if (nft_is_base_chain(chain)) {
> vvv     CID 1505166:  Memory - corruptions  (UNINIT)
> vvv     Using uninitialized value "basechain".
> 2188     		basechain->ops.hook_ops_type = NF_HOOK_OP_NF_TABLES;
> 2189     		nft_trans_chain_policy(trans) = policy;

Hmm, I do not see how is_base_chain() can be true while basechain
pointer is garbage.

However its probably better for readability to move the NF_HOOK_OP_...
assignment closer to where the basechain ops are allocated.
