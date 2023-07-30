Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5FC76891B
	for <lists+linux-next@lfdr.de>; Mon, 31 Jul 2023 00:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjG3W3a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 30 Jul 2023 18:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjG3W33 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 30 Jul 2023 18:29:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB4010E0
        for <linux-next@vger.kernel.org>; Sun, 30 Jul 2023 15:29:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E82460DD8
        for <linux-next@vger.kernel.org>; Sun, 30 Jul 2023 22:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67902C433C8;
        Sun, 30 Jul 2023 22:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690756164;
        bh=g1Ue+PjEC5hU2YfHHq9UbtGmqTEpcUCt/DTSnqZnzg0=;
        h=Date:From:To:Cc:Subject:From;
        b=e67DhUF9IO8j+NcUKuB8hX99P1ABgU5hmGC6V9Hqr/rvLdf/KW46S2g+pzuW/FjRS
         DZOZ3vOMzZJ/PM//DCnPkyEr6YA6+PzZ8goWiEkEZw02fvY83LDm5MwWWqta6QF+oT
         JnNhGmTjEu04pcnLe4Y0gA8IlayuPEIBuHC1LA1GA6sqPAqegP16iSnHhlU5ictPiX
         bZn8uqRG3jhZu9bsyqzDZxRe80XeEqaZZ4mvcVclZ5mCGvzFS21+JVgFoqyUNF5hYm
         vlD9JYD+Fr8LDOcUwoA11nVjV+ixB65Oz2tIjPBGn+vio7iyR8P/H4fpze2wZcQ6/r
         gz/a2xY0xL3Qg==
Date:   Mon, 31 Jul 2023 00:29:21 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-next <linux-next@vger.kernel.org>
Subject: Request for i2c inclusion in linux-next
Message-ID: <20230730222921.637gy5xbtfekmite@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

could you please include in the linux-next i2c related branches
from my repository:

https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/linux.git

the following branches:

for next:	i2c/andi-for-next
fixes:		i2c/andi-for-current

Thank you,
Andi
