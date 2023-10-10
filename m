Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E43E7C04B1
	for <lists+linux-next@lfdr.de>; Tue, 10 Oct 2023 21:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343884AbjJJTej (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Oct 2023 15:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343889AbjJJTei (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Oct 2023 15:34:38 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7025B4
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 12:34:34 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9D8A797D;
        Tue, 10 Oct 2023 19:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9D8A797D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1696966473; bh=/KmXz804Zz1/1Q86h1kvpFq1HA+2LOyIPxhwPmLjz4I=;
        h=From:To:Subject:Date:From;
        b=SE0miLvQaDWffenB7yF+dk9ZDnwwiBPdgxPIx7lC4QfJANRmg59ZYy8d//7T8E2Um
         LfwJ/JZCG8QpnZkFSqGmGdh1KvMB4dK3qoIaQPdCkwYXe+WNBbxvvDePmaH+4BjEcR
         IHNGFi3GLK84AyU2WKN7b95O7V237GHmprG3iVMHsyd9Q66QugmLR+6HEYb1zAj4AL
         pKx1QriCdH/05RlJqJMdZ69KYiOik/X+2RZrOqF60HicTnev3iufKEpgIs1GGVRRNb
         gsuQvjm4LGw5/1FnFa+A0g4RsekAV8dJbZK7bSv1ve4xqjfHFM9NUHw4VBYqhFesy7
         lgGpqRwggrD8Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Costa Shulyupin <costa.shul@redhat.com>,
        linux-next@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: Upcoming merge conflict docs/powerpc
Date:   Tue, 10 Oct 2023 13:34:32 -0600
Message-ID: <87o7h65l13.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi, Stephen,

Just a note to say that the move of the powerpc docs under
Documentation/arch showing up in in docs-next shortly adds a conflict
with the powerpc tree, which adds a new file (kvm-nested.rst) to the old
directory.  The fix is just to add it in the new location.

Thanks,

jon
