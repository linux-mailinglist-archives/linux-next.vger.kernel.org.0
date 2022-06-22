Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 197A15554CE
	for <lists+linux-next@lfdr.de>; Wed, 22 Jun 2022 21:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376443AbiFVTmC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jun 2022 15:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377360AbiFVTlZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jun 2022 15:41:25 -0400
Received: from sonic303-3.consmr.mail.bf2.yahoo.com (sonic303-3.consmr.mail.bf2.yahoo.com [74.6.131.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98970403C9
        for <linux-next@vger.kernel.org>; Wed, 22 Jun 2022 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1655926864; bh=AFtNamzmMrjBz4lo+N4Shhsg6c75R4KDFM5Svd3ANkU=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=punESxZXZ4Bq+KrLz/a2ksMk1zdABx59C2poIaiww8Ne0QYcSJhVG1j5XpOLCdeBm4OVu4bUw4FbpcJvOvUKUVrmqsoIGyYEhczvu49j7dwk+cG2pcgMMIyC36+FvJPovyJahKaXAFArGsix1Tsfv31GTn58tZ0DehR86iiOQlvEJtABrUkU7wBn+3hRwM0vL5jiH33O/YMWfygMIqxUuQsbcwLjifO9r49tClMFlMxasLO2oRkCKep8n2ejB23Ap1mZledAt4Zd0/Ck7QBaQoQCAurQI3sRt7fesdu1PM88532gtxLFa6CWjlgqZZoPWQfioQ6O/QDe4Mb2DUmjDA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1655926864; bh=yltj2E5tfqaWBlmorrxmwFct8Pme6Tosvz/4PK79tPa=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=plQ1WNMl2zl+I8rNiMlbF+cHa0hzANjrLZieD+uVn1bjmNmtvJCVKHsfyJ0zwGDxZVlDMjicsLMfdWqNEHN1tUEcM8OBbWF06GIYpnqTcJQjVWALWIyjZzsi9HFvtF2qZ7wYlNSQS+fKGkrvLI/Y4ZFCglz2APv5JxplIUfhfRZ9tj3W/N3kwm3bucXTSxb9JbABO/8qQ2wnTsIzSN/Z62BPn2z8dh2FYBBq/tTbQfdAPvMpj0h1RQN3dGuYQN+dlm9tmpzrP71/Tl2PhvQveAjJK/C85AOW0D3NaoWnYaUNRICZXg9g8+2WpRrGsfOYewF+C5WycIXcty0Rfi+tyg==
X-YMail-OSG: OziUU5EVM1mSgXcTEEAt53Xwupu0nneywwdueiC.W.KTNN4tAVFnwPuk4V.U2CC
 z_yBecSIYDp4UUR9zv5_p7m26ejHMDVhetUzUHFr07K7A68wGOsJw.PI0j.L4N1y7wDe8QBr3pYp
 IFkVhimI38GzYwpppC0CMVPBCIMao_fhGJvHghK6OjwKZPocmlLo1YinzlJylgWtgVpcewx3ctP0
 8.N0NgX95oVMcm_DiPpm5zjOlkMyIAFZL4RnoTYB5yXZCUKJ8e8COVaDWDAYomdqmrxwpPlqe9ur
 8Lzr0ERUSGGkQxppKBHkiw4rBpVU36LUpGW4dBoyzsKz.ageMwbGRoPH2rpiicV8Km8sjO4PhBjB
 IZKOX1uKjwi8IDyR0lGYu3upYm1XIr2Vikb3cIoK4OOmoOWUw0nuyJHjGM_Vn9rIbCOY66h6K9is
 Kzyw8N.lkNOfjpOvbRtaDmWsjOi2z5_5Y71PP7hkv3RNUxJvwpnhdDIJz7mzfHRP_SC_g4NPJJ_5
 6u1xODaL8WZZLUyuzLFxUyTaqQ1sm5LOPTu4yNmE6Ujlj3qmwVUWTD2Es7pnMcojf.L7MIhSCv8z
 f0fhW.8aD92Uyu084JxtHMUSwdve0YIsAHYB58D4SGs3rMitLEotCkJ0EnPRT5HIR5nKayPW0puA
 JJkeywoWUB9UjMPdmKkpZqBPiSLOKEe.pISRb9x0hbi7qDbzXiXMwHQRmlkIU3.rumcu1Uhhmilc
 v8eR7Ax2DAxpnRoNbs0zh6ZFKnHcYw720TRc4pNmzxVORg_dirbk94poGtPytQnwLEL5FRD3SsCO
 QhM19W3Fja_it1aNQiVXTnl51TNgv9tZwCsFxOBimxB2oOmYMdm5cv.Fat6kJkJg90UKHBXLdXJ1
 JTye8FAiB9KTiszO_5Rha52p3.W.qgo2dR7IAHfXP_inVUUcKc7BGKTkHm9d6OZzvenveLnbzvcY
 FAuE1oaqiwHxGoMHCiJOYp9cQ3V_aa5YwkFmlKlbCAFrysPRKkprYDUb4nQro1KACVjE1VMT2MMV
 shhIViN.pXfrk2VieTHzuuPw7BxYZitwSpIkkLU9MnpIkPfPu3tYau98R5c6ory.heK1MwXgWGm1
 vprP.Y1ffk8R5Fy_ZzLWuwqzMH2WfazMQNZel5BW1s.KybK0Keg.Hdit8_1SmkWi2ngH_1Ud3liE
 eqUIaLo7Eqp1GMApIxPqXbhAWZlmbzdyQImoq4GfwLqrdwbu3BqkvjGzzfGsRuiO5oRg21UG4zEZ
 VvotZ1jXEissixoFsij4iKthlON9GcrHIDPAWSHp76.QPnEc.31iSf6ZQNcbeXVRqnlmz2mbkwBe
 g5O.kvktE8zkCW0CfEXr63jCTRgDOaSv0bW2SvO65SsUgC9NTs_98Bit2Xhi2du_.w3aSiJK7Dlv
 AzamCCEZLCapEPqmgNlCS.BPWVx2ALKVzS.9SFZ4NuE0McRhGyuguIzjUhS5TQmwC9D6Inrj5ram
 lQ9XpA0P6SvFRglgwqQAC.sIVTlDx1SyF1AMpXGCuBkgyVy.Fbv21nrY8fnCHHaPsUTGR7JlNBSD
 gIrSVelY3qQXar6V.JWxs9NTIYrywzhCj8y7uVhGffHjQvJr2yT6tSEdTTwRAAGKYzwzOEXvero_
 MTHnpCu3LaoIc4hRNH94IV.ssOfP9zZnytTa9HzFpKxtUop33wKu0aHo36ThIye9zrP5XJjSysA_
 3X8O1dgIo.JW.TEvZGKR6Swg.aXrRXJ0i31JNrl5sCq58yFb2cAg4m2eQ.YRPL6cMeaA.euNe7cX
 dogstuqgn0AO4QLAIAHp16T7a.KDK1MPG5.1v70RAOOyKwTKr76cT5xxOtCdOUFOF0GTWdOO4g5o
 _GLiiAH6LlsvcnhX7JAXnLzxHe9RFn8OdUmAvDa.PI1MBmWGYhHOGkW9L0tmlfiC8HAn9CS8H1o6
 XDQ1or9s07UdR8jsuIYsFmArzwmOMLNUFyL_Ak56df4RUqns076SvFTYGnHnrrSsiHBrd8H0XAvz
 txGO3gOb51H_yQVnW6DHeiPHtlS.3gJqrQNw7lpd6OgpRSueel8XFjKoiSiCluUjBDD70r3yhrAb
 FLv_zT865YS.EqCf_l6wt.hvd7.iXegjK6d3QnOswJIne17eXu91vOlJ.NVw7lZR5VcKzCnMQGDI
 RW72oZSKR0KoNJMr1oZP5BydZ.T9ovgljc8vvXVSA_pVQGQZbBaIkE9S.OzsOiFswJe985TdJCQ-
 -
X-Sonic-MF: <kamlesh.regar014@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.bf2.yahoo.com with HTTP; Wed, 22 Jun 2022 19:41:04 +0000
Received: by hermes--canary-production-sg3-559fcd5995-5cxt2 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3faa7e4b264cf581a30b6b57431b8bac;
          Wed, 22 Jun 2022 19:30:30 +0000 (UTC)
Date:   Thu, 23 Jun 2022 01:00:27 +0530 (GMT+05:30)
From:   kamlesh.regar014@aol.com
To:     linux-next@vger.kernel.org
Message-ID: <97049677.98.1655926227178@localhost>
Subject: All indicators are pointing to
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
References: <97049677.98.1655926227178.ref@localhost>
X-Mailer: WebService/1.1.20280 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Greetings, hopefully 2022 is treating you well so far.
Many groups are continuing to move toward remote work through the rest of this year and possibly beyond. Will that development lead to increased collaboration as a result?
