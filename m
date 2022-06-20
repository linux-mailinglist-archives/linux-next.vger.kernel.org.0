Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE0255249E
	for <lists+linux-next@lfdr.de>; Mon, 20 Jun 2022 21:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242638AbiFTTee (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jun 2022 15:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233184AbiFTTed (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jun 2022 15:34:33 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F81D1C128
        for <linux-next@vger.kernel.org>; Mon, 20 Jun 2022 12:34:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A5A9DCE170E
        for <linux-next@vger.kernel.org>; Mon, 20 Jun 2022 19:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E347C3411B;
        Mon, 20 Jun 2022 19:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655753665;
        bh=hPL7ASEhq5ZtZ46qW7+ocF2cU3uLg5ZciRIYxY22cvU=;
        h=Date:To:From:Subject:From;
        b=jzEjcprM/CEuuuU6QYaAXjmpuzcxkcjyzby6IOYq1OnhDQ6wAyf1U7QlbChGmtjcL
         i8nWtGJjuH89oKaMuon1yR6q8a0bbZTvD2wOUc+7DB6BxS9lXAIKj/XgPOEP7f/feg
         GH21z1CQvSLjoLE9hhLnsI/B6doKZtJdI7TXbQQWB5hJCSxp9HZh/LO1AWHzpFheFO
         OLp962Juyf9HoHczq4li/bwLqdVi5AZJK03eIGSdV0Ft6u/i+vMJRtPERyNKV4+joC
         UYsrDRXZando93sUv5GYM9qysHuHXD3b5uuHOoRuESnsLH/R7jMjtBWiNJ6u15zrfP
         Hz8DpkCSpZuDA==
Message-ID: <b2e86d7a-401d-f48f-2c02-e8253885ab51@kernel.org>
Date:   Mon, 20 Jun 2022 21:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Subject: Include in next: krzk/linux-dt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Please kindly include in linux-next my new tree:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git

branch: for-next
branch for pending-fixes: fixes

I tend to create a lot of cleanup patches for Devicetree bindings and
DTS files. Since some time I started to pick them up to my Samsung SoC
tree and send to arm-soc (Arnd, Olof). This way I will split it from
Samsung SoC work to independent cleanup stuff.

The tree will be sent with pull requests to arm-soc (Arnd, Olof) or to
DT (Rob Herring).

Best regards,
Krzysztof
