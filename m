Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1FE644AE9
	for <lists+linux-next@lfdr.de>; Tue,  6 Dec 2022 19:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiLFSMO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Dec 2022 13:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiLFSMN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2022 13:12:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B45A3B9F6
        for <linux-next@vger.kernel.org>; Tue,  6 Dec 2022 10:12:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 262A461602
        for <linux-next@vger.kernel.org>; Tue,  6 Dec 2022 18:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F922C433C1;
        Tue,  6 Dec 2022 18:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670350331;
        bh=XZVaq9xQ4Osoi5iqrW6KNweGzDb6TxsGKCiIaIuU7V8=;
        h=Date:From:To:Cc:Subject:From;
        b=pvdwjCXGcjvfehVXEo9E2vY26XdC6rrpIMYHzucE18MC3EV8f8S2A6pjRTE+E0bYh
         nq3Tk1wooUlo7S+yxoJZzbavTNmUoIhRWxjebuCAR95sezs2m+POOjgtnMmt1VfvNb
         JjohzP2KLtritCd0XUM85XpUCcqbIRNK8r8bMMIkQwTufidZTJaeJyrTHJNTaUIVog
         SVD46r6Fdv3V6XMJU7zZaRYbvuoXmeyhIIRINkj9o6gwMk4z5JcIGq4pfsGS+6Y/8q
         1kf8S/8RLjXshF8vBGG3aO+pXGxVDvDDIEyLfPLKr/tyaFOh88OX4y/OlHAgryEDRE
         rDoF091MS0CAA==
Date:   Tue, 6 Dec 2022 12:12:09 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-next@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: linux-next: Expected merge conflict in iio qcom,spmi-vadc.yaml
Message-ID: <20221206181209.zj36eezbj2irktmo@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

I messed up and picked an IIO DT binding change a while ago without
synchronizing with Jonathan and we've now ended up with a failing
dt_binding_check because of this.

The solution for this is:
https://lore.kernel.org/lkml/20221117121307.264550-1-krzysztof.kozlowski@linaro.org/

After considering the various solutions I've picked this up as:
51f7be212ae6 ("dt-bindings: iio: adc: qcom,spmi-vadc: fix PM8350 define")

This does however cause a merge conflict between the qcom- and
iio-trees. Could you please solve this in line with Krzysztof's patch?

Thanks,
Bjorn
